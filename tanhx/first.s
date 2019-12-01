 ;tanhx 
 
 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
	 IMPORT printMsg2p
     EXPORT __main
	 ENTRY 
__main  FUNCTION

	VLDR.F32 S15, =3.14159; END OF x IN RADIANS
	VLDR.F32 S16, =0.0174533; VALUE OF 1 DEGREE IN RADIAN
	VLDR.F32 S1, = -3.14159;START of x in radians
	VLDR.F32 S31, =1000 ; need to multiply tanhx value with 1000 as it lies between -1 to +1
	VLDR.F32 S25,=57.2958 ; value of 1 radian in degrees
TOP		VMOV.F32 S30,S1
		VMUL.F32 S30,S30,S25
		VCVT.S32.F32 S30,S30
		VMOV.S32 R0,S30 ; degree
		;BL printMsg1
		MOV R5, #30;Number of iterations n
		MOV R4, #1; i
	
		VLDR.F32 S3, =1; = to store intermediate value t
		VLDR.F32 S4, =1; =to store factorial value
		VLDR.F32 S5, =1; output
		VLDR.F32 S7, =1;
		MOV R8, #1;
		; calculate e^x
LOOP  	CMP R5, R4;Compare
		BLE L2 ; Branch to L2 after calculating e^x
		BLT stop; Condition to check to enter inside loop
		VDIV.F32 S6, S1, S4; =divide x by factorial
		VMUL.F32 S3, S3, S6; =multiply x*t
		VADD.F32 S5, S5, S3; =add all terms and save it at S5
		VADD.F32 S4, S4, S7;=to calculate factorial
		ADD R4, R4, R8; incrementing count
		B LOOP;

; calculate tanh x using (e^x - e^-x)/(e^x+e^-x)
L2	 VLDR.F32 S9, =1
	 VDIV.F32 S10,S9,S5 ; DO 1/e^x
	 VSUB.F32 S11,S5,S10 ; DO e^x - e^-x  IS EQ1
	 VADD.F32 S12,S5,S10 ; DO e^x + e^-x  IS EQ2
	 VDIV.F32 S13,S11,S12; EQ1 BY EQ2 ; tanh x value
	 VMOV.F32 S14,S13
	 VMUL.F32 S14,S14,S31
	 VCVT.S32.F32 S14,S14
	 VMOV.S32 R1,S14
	 BL printMsg2p ; Print the values 
	 VADD.F32 S1,S16,S1
	 VMOV.F32 R10, S15
	 VMOV.F32 R9, S1
	 CMP R9,R10
	 BLE TOP ; loop through all values
stop B stop ; stop program
	 ENDFUNC
	 END