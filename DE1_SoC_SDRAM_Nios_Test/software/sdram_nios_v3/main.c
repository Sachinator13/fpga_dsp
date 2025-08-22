// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------


#include "terasic_includes.h"
#include "mem_verify.h"
#include "system.h"
#include "alt_types.h"




int main(alt_u32 BaseAddr)
{
	bool bPass, bLoop;
	bool pressed = FALSE;
	int TestIndex ;
	alt_u32 InitValue = 0x01;
	bool bShowMessage = TRUE;
	alt_u32 TimeStart, TimeElapsed;
	alt_u8 Status,ButtonStatus;
	alt_u32 value;
	const alt_u8 ButtonMask = 0x0F; // 4 button
	alt_u32 pDes = (alt_u32 *)BaseAddr;
	alt_16 data_in_status;



	printf("=====changes gone through 2 ,SDRAM Test! Size=%dMB (CPU Clock:%d) =====\r\n", SDRAM_SPAN/1024/1024, ALT_CPU_CPU_FREQ);



	while(1){
		data_in_status = IORD(DATA_IN_BASE, 0);
		printf("Data in = 0x%08X\n", data_in_status);
		IOWR_32DIRECT(pDes, 0, data_in_status);
		printf("read back = 0x%8X\n", data_in_status);
		value = IORD_32DIRECT(pDes, 0);
		printf("read back = 0x%8X\n", value);



		usleep(500000);





//        ButtonStatus = ButtonMask;
//        while((ButtonStatus & ButtonMask) == ButtonMask){
//
//        	ButtonStatus = IORD(KEY_BASE, 0);
//        }
//
//        if ((ButtonStatus & 0x01) == 0x00){
//            bLoop = TRUE;
//        }else{
//            bLoop = FALSE;
//        }
//
//
//		//
//        bPass = TRUE;
//        TestIndex = 0;
//
//        if ((ButtonStatus & 0x01) == 0) printf("KEY0 pressed\n");
//        if ((ButtonStatus & 0x02) == 0) printf("KEY1 pressed\n");
//        if ((ButtonStatus & 0x04) == 0) printf("KEY2 pressed\n");
//        if ((ButtonStatus & 0x08) == 0) printf("KEY3 pressed\n");
//
//
//
//        if ((ButtonStatus & 0x02) == 0x00){
//        	// write
//        	IOWR_32DIRECT(pDes, 0, 0xAAAA);
//        	printf("wrote 0xAAAA into sdram memory");
//        	pressed = TRUE;
//
//        }
//
//        if ((ButtonStatus & 0x04) == 0x00){
//        	// write
//        	IOWR_32DIRECT(pDes, 0, 0xBBBB);
//        	printf("wrote 0xBBBB into sdram memory");
//        	pressed = TRUE;
//
//        }
//        if(pressed = TRUE){
//
//        	value = IORD_32DIRECT(pDes, 0);
//        	printf("read back = 0x%08X\n", value);
//        	pressed = FALSE;
//        }



//        do{
//        	TestIndex++;
//        	printf("=====> SDRAM Testing, Iteration: %d\n", TestIndex);
//        	TimeStart = alt_nticks();
//
//        	if (bPass)
//        		bPass = TMEM_Verify(SDRAM_BASE, SDRAM_SPAN, InitValue,  bShowMessage);
//
//        	TimeElapsed = alt_nticks() - TimeStart;
//        	printf("SDRAM test:%s, %d seconds\r\n", bPass?"Pass":"NG", (int)(TimeElapsed/alt_ticks_per_second()));
//
//            usleep(500*1000);
//            if (bPass && bLoop){  // is abort loop?
//            	ButtonStatus = IORD(KEY_BASE, 0);
//            	if ((ButtonStatus & ButtonMask) != ButtonMask)
//            		bLoop = FALSE; // press any key to abort continued test
//            }
//            usleep(600*1000);
//        }while(bLoop && bPass);
	} // while(1)


    return 0;
}

