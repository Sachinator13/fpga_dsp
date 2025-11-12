#include "overdrive.h"
#include <stddef.h>

// ------------------------ Fixed-point helpers ------------------------
static inline int16_t sat16(int32_t x){
    if (x >  32767) return  32767;
    if (x < -32768) return -32768;
    return (int16_t)x;
}

static inline int32_t q15_mul(int32_t a, int32_t b){
    // (a*b)>>15 with sign, 32-bit intermediate
    return (int32_t)(( (int64_t)a * (int64_t)b ) >> 15);
}

// ------------------------ Anti-alias FIR -----------------------------
// 33-tap Hamming-windowed low-pass for 48 kHz, ~10 kHz cutoff.
// Generated as sinc(fc=10k/48k) * Hamming, normalized to DC gain = 1.0
// Stored as Q1.15; sums to 32768.
static const int16_t FIR33_LP_10K_Q15[OD_FIR_TAPS] = {
     45,   44,  -43, -122,    0,  260,  189, -368, -608,
    242, 1242,  429,-1950,-2263, 2511, 9964,13624, 9964,
    2511,-2263,-1950,  429, 1242, 242, -608, -368, 189,
     260,    0, -122,  -43,   44,   45
};

// Circular buffer FIR (mono)
static inline int32_t fir33_run(Overdrive* od, int16_t x){
    int i;
    // push sample
    od->fir_idx = (od->fir_idx == 0 ? (OD_FIR_TAPS-1) : (od->fir_idx-1));
    od->fir_hist[od->fir_idx] = x;

    // MAC
    int32_t acc = 0;
    int idx = od->fir_idx;
    for (i = 0; i < OD_FIR_TAPS; ++i){
        acc += (int32_t)od->fir_hist[idx] * (int32_t)od->fir_coeff_q15[i]; // Q0 * Q15 => Q15
        idx++; if (idx == OD_FIR_TAPS) idx = 0;
    }
    // acc is sum of (x * h_q15) -> Q15 * 32768 scaling already respected by normalization
    // Shift back to Q1.15
    acc >>= 15;
    return acc; // still in Q1.15 (int32)
}

// ------------------------ Waveshaper (soft overdrive) ----------------
// Cubic soft clipper: y = s - (s^3)/3, all in Q1.15 domain.
// Input is pre-amplified by 'drive_q15'. The cubic expands harmonics;
// the FIR after this stage attenuates out-of-band content to reduce aliasing.
static inline int32_t softclip_cubic_q15(int32_t s_q15){
    // s^3 in Q1.15: (((s*s)>>15)*s)>>15
    int32_t s2 = q15_mul(s_q15, s_q15);
    int32_t s3 = q15_mul(s2,     s_q15);
    // s - (s^3)/3
    int32_t y  = s_q15 - (s3 / 3);
    // saturate to Q1.15 range
    if (y >  32767) y =  32767;
    if (y < -32768) y = -32768;
    return y;
}

// ------------------------ Public API --------------------------------
void od_init(Overdrive* od){
    int i;
    if (!od) return;

    // Copy coefficients
    for (i = 0; i < OD_FIR_TAPS; ++i)
        od->fir_coeff_q15[i] = FIR33_LP_10K_Q15[i];

    // Clear history
    for (i = 0; i < OD_FIR_TAPS; ++i)
        od->fir_hist[i] = 0;
    od->fir_idx = 0;

    // Defaults: drive ~ 4.0, post level 0.5, full wet
    od->drive_q15 = 4 * 32767;   // >= 1.0 allowed; we don’t clamp so you can go wild
    od->level_q15 = (int32_t)(0.5f * 32767.0f);
    od->mix_q15   = 32767;
}

void od_set_drive(Overdrive* od, int32_t drive_q15){ if (od) od->drive_q15 = drive_q15; }
void od_set_level(Overdrive* od, int32_t level_q15){ if (od) od->level_q15 = level_q15; }
void od_set_mix  (Overdrive* od, int32_t mix_q15)  { if (od) od->mix_q15   = mix_q15;   }

void od_set_drive_f(Overdrive* od, float d){ if (od) od->drive_q15 = (int32_t)(d * 32767.0f); }
void od_set_level_f(Overdrive* od, float g){ if (od) od->level_q15 = (int32_t)(g * 32767.0f); }
void od_set_mix_f  (Overdrive* od, float m){
    if (!od) return;
    if (m < 0.0f) m = 0.0f; if (m > 1.0f) m = 1.0f;
    od->mix_q15 = (int32_t)(m * 32767.0f);
}

// Main processing: mono in -> mono out
int16_t od_process_sample(Overdrive* od, int16_t x){
    if (!od) return x;

    // Dry path (keep for mix)
    int16_t dry_q15 = x;

    // Pre-gain
    int32_t s = q15_mul((int32_t)x, od->drive_q15);   // Q1.15

    // Nonlinear
    int32_t y = softclip_cubic_q15(s);                // Q1.15

    // Anti-aliasing low-pass (post)
    y = fir33_run(od, sat16(y));                      // Q1.15

    // Output level
    y = q15_mul(y, od->level_q15);                    // Q1.15

    // Wet/dry mix: out = mix*wet + (1-mix)*dry
    int32_t wet  = q15_mul(y,           od->mix_q15);           // Q1.15
    int32_t dry  = q15_mul(dry_q15, (32767 - od->mix_q15));     // Q1.15
    int16_t out  = dry;                                    // Q1.15

    return out;
}
