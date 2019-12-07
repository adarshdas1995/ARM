 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printHEAD1
	 IMPORT printHEAD2
	 IMPORT printHEAD3
	 IMPORT printHEAD4
	 IMPORT printHEAD5
     IMPORT printMsg4p
	 ENTRY 
__main  FUNCTION

		
		;S18 = W1,S19 = W2, S20 = W3, S21 = (Bias) as provided in the python code
		
		;DS=DATA_SET
		
AND_DS1		BL printHEAD1
			VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.2
			VLDR.F32 S20,=0.2
			VLDR.F32 S21,=-0.2
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

AND_DS2		VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.2
			VLDR.F32 S20,=0.2
			VLDR.F32 S21,=-0.2
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

AND_DS3		VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.2
			VLDR.F32 S20,=0.2
			VLDR.F32 S21,=-0.2
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

AND_DS4		VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.2
			VLDR.F32 S20,=0.2
			VLDR.F32 S21,=-0.2
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

			
OR_DS1		BL printHEAD2
			VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.7
			VLDR.F32 S20,=0.7
			VLDR.F32 S21,=-0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

OR_DS2		VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.7
			VLDR.F32 S20,=0.7
			VLDR.F32 S21,=-0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

OR_DS3		VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.7
			VLDR.F32 S20,=0.7
			VLDR.F32 S21,=-0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

OR_DS4		VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.7
			VLDR.F32 S20,=0.7
			VLDR.F32 S21,=-0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NOT_DS1		BL printHEAD3
			VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=0
			VLDR.F32 S21,=0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NOT_DS2		VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=0
			VLDR.F32 S21,=0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NAND_DS1	BL printHEAD4
			VLDR.F32 S18,=0.6
			VLDR.F32 S19,=-0.8
			VLDR.F32 S20,=-0.8
			VLDR.F32 S21,=0.3
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NAND_DS2	VLDR.F32 S18,=0.6
			VLDR.F32 S19,=-0.8
			VLDR.F32 S20,=-0.8
			VLDR.F32 S21,=0.3
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NAND_DS3	VLDR.F32 S18,=0.6
			VLDR.F32 S19,=-0.8
			VLDR.F32 S20,=-0.8
			VLDR.F32 S21,=0.3
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NAND_DS4	VLDR.F32 S18,=0.6
			VLDR.F32 S19,=-0.8
			VLDR.F32 S20,=-0.8
			VLDR.F32 S21,=0.3
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NOR_DS1		BL printHEAD5
			VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=-0.7
			VLDR.F32 S21,=0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NOR_DS2		VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=-0.7
			VLDR.F32 S21,=0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #0; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG
			
NOR_DS3		VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=-0.7
			VLDR.F32 S21,=0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #0; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG

NOR_DS4		VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=-0.7
			VLDR.F32 S21,=0.1
			MOV R0, #1; input X1
			VMOV.F32 S11,R0
			VCVT.F32.S32 S11,S11
			MOV R1, #1; input X2
			VMOV.F32 S12,R1
			VCVT.F32.S32 S12,S12
			MOV R2, #1; input X3
			VMOV.F32 S13,R2
			VCVT.F32.S32 S13,S13
			B EXP_X
			LTORG
			

;S28 will store the final X1*W1 + X2*W2 + X3*W3 + Bias
EXP_X	VMUL.F32 S28, S18, S11
		VMUL.F32 S0, S19, S12
		VADD.F32 S28, S28, S0
		VMUL.F32 S1, S20, S13
		VADD.F32 S28, S28, S1
		VADD.F32 S28, S28, S21
		B EXPROUTINE
		
				
EXPROUTINE	VMOV.F32 S20, S28; x:Number to find e^x
	        VMOV.F32 S22, #20; Number of iterations for e^x expansion
			VMOV.F32 S7, #1;  count
			VMOV.F32 S8, #1;  temp variable
			VMOV.F32 S9, #1;  result initialized to 1
			VMOV.F32 S23, #1;  register to hold 1
			VMOV.F32 S14,#1;

Loop 		VCMP.F32 S22, S7; Comparison done for excuting taylor series expansion of e^x for s2 number of terms
			VMRS.F32 APSR_NZCV,FPSCR; to copy fpscr to apsr
			BLT SIG_FUNC;
			
			VDIV.F32 S10, S20, S7; temp1=x/count
			VMUL.F32 S8, S8, S10; temp=temp*temp1;
			VADD.F32 S9, S9, S8; result=result+temp;
			VADD.F32 S7, S7, S23; count++
			B Loop;
			
SIG_FUNC	VADD.F32 S24,S9,S14;  (1+e^X)
			VDIV.F32 S25,S9,S24;	  g(X) = 1/(1+e^-X) == (e^X)/(1+e^X)
			B FINAL;
	

; S15 will hold 0.5 for comparison to finalise the logical output for a particular gate
FINAL	VLDR.F32 S15 ,=0.5 ; thresholding to determine if logic 1 or logic 0
		VCMP.F32 S25, S15 ; compare the output of sigmoid routine with S15
		VMRS.F32 APSR_nzcv,FPSCR ; Transfer floating-point flags to the APSR flags
		ITE HI
		MOVHI R3,#1; if S20 > S15
		MOVLS R3,#0; if S20 < S15
		BL printMsg4p	 ; Refer to ARM Procedure calling standards.
		
		ADD R9,R9,#1;	
		CMP R9,#1
		BEQ AND_DS2
		CMP R9,#2
		BEQ AND_DS3
		CMP R9,#3
		BEQ AND_DS4
		CMP R9,#4
		BEQ OR_DS1
		CMP R9,#5
		BEQ OR_DS2
		CMP R9,#6
		BEQ OR_DS3
		CMP R9,#7
		BEQ OR_DS4
		CMP R9,#8
		BEQ NOT_DS1
		CMP R9,#9
		BEQ NOT_DS2
		CMP R9,#10
		BEQ NAND_DS1
		CMP R9,#11
		BEQ NAND_DS2
		CMP R9,#12
		BEQ NAND_DS3
		CMP R9,#13
		BEQ NAND_DS4
		CMP R9,#14
		BEQ NOR_DS1
		CMP R9,#15
		BEQ NOR_DS2
		CMP R9,#16
		BEQ NOR_DS3
		CMP R9,#17
		BEQ NOR_DS4

		
		
stop B stop ; stop program
	 ENDFUNC
	 END