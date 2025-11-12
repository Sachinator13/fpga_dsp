#ifndef OVERDRIVE_H
#define OVERDRIVE_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// ---------- Public knobs (Q1.15 unless otherwise stated) ----------
// drive_q15:    input pre-gain multiplier (1.0 = 32767). Higher = more distortion
// level_q15:    output gain after anti-alias FIR
// mix_q15:      wet/dry mix (0=wanted dry/bypass, 32767=all wet)

typedef struct {
    // FIR anti-alias (post waveshaper)
    #define OD_FIR_TAPS 33
    int16_t fir_coeff_q15[OD_FIR_TAPS];
    int16_t fir_hist[OD_FIR_TAPS];
    int     fir_idx;

    // user parameters
    int32_t drive_q15;   // Q1.15
    int32_t level_q15;   // Q1.15
    int32_t mix_q15;     // Q1.15
} Overdrive;

// Initialize with sensible defaults for 48 kHz
void od_init(Overdrive* od);

// Optional: set parameters on the fly (all Q1.15 except ‘set_mix_f’)
void od_set_drive(Overdrive* od, int32_t drive_q15);
void od_set_level(Overdrive* od, int32_t level_q15);
void od_set_mix(Overdrive* od, int32_t mix_q15);

// Convenience: float setters (0.0–something); converted internally to Q1.15
void od_set_drive_f(Overdrive* od, float d);
void od_set_level_f(Overdrive* od, float g);
void od_set_mix_f(Overdrive* od, float m);

// Process one 16-bit mono sample (Q1.15 PCM). Returns 16-bit mono result.
int16_t od_process_sample(Overdrive* od, int16_t x);

#ifdef __cplusplus
}
#endif
#endif
