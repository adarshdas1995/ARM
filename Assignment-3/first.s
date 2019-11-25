;logic gate implementation using neural network
 
;start of program
 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
     IMPORT printMsg4p
	 ENTRY 
__main  FUNCTION

	    ;for NOT following are the valid combination of input as can be seen in python code 
		;X0->1, X1->0, X2->0 ; we are considering third input X2(deactive) to keep similarity for all logic operations
		;X0->1, X1->1, X2->0
		VLDR.F32 S11,=1 ;X0
		VLDR.F32 S12,=1	;X1
		VLDR.F32 S13,=1	;X2
		
		;to display it we have to store input in registers
		MOV R0,#1
		MOV R1,#1
		MOV R2,#1
		ADR.W  R6, BranchTable_Byte 
		
		MOV R7,#0 ; to select one option in switch case (gates)
		;0->AND
		;1->OR
		;2->NOT
		;3->NAND
		;4->NOR
		;5->XOR
		;6->XNOR
		TBB   [R6, R7] ; switch case equivalent in Arm cortex M4 
		
		;S18 = W0,S19 = W1, S20 = W2, S21 = (Bias) as provided in the python code
AND	VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.2
			VLDR.F32 S20,=0.2
			VLDR.F32 S21,=-0.2
			B EXP_X
OR	VLDR.F32 S18,=-0.1
			VLDR.F32 S19,=0.7
			VLDR.F32 S20,=0.7
			VLDR.F32 S21,=-0.1
			B EXP_X
NOT	VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=0
			VLDR.F32 S21,=0.1
			B EXP_X
NAND	VLDR.F32 S18,=0.6
			VLDR.F32 S19,=-0.8
			VLDR.F32 S20,=-0.8
			VLDR.F32 S21,=0.3
			B EXP_X
NOR	VLDR.F32 S18,=0.5
			VLDR.F32 S19,=-0.7
			VLDR.F32 S20,=-0.7
			VLDR.F32 S21,=0.1
			B EXP_X
XOR	VLDR.F32 S18,=-5
			VLDR.F32 S19,=20
			VLDR.F32 S20,=10
			VLDR.F32 S21,=1
			B EXP_X
XNOR	VLDR.F32 S18,=-5
			VLDR.F32 S19,=20
			VLDR.F32 S20,=10
			VLDR.F32 S21,=1
			B EXP_X

;S28 will store the final X0*W0 + X1*W1 + X2*W2 + Bias
EXP_X				VMLA.F32 S28, S18, S11
					VMLA.F32 S28, S19, S12
					VMLA.F32 S28, S20, S13
					VADD.F32 S28, S28, S21
					B EXPROUTINE

;offset calculation for switch case
BranchTable_Byte	DCB    0
					DCB    ((OR-AND)/2)
					DCB    ((NOT-AND)/2)
					DCB    ((NAND-AND)/2)
					DCB    ((NOR-AND)/2)
					DCB    ((XOR-AND)/2)
					DCB    ((XNOR-AND)/2)

;this program performs e^x,the result will be stored in S20
EXPROUTINE	VMOV.F32 S20, #1 ; Sum Variable
			VMOV.F32 S6, #25 ; 'n' variable - sequence size
			;VMOV.F32 S19, #5 ; 'x' varaiable - in e^x
			VMOV.F32 S21, #1 ; constant
loop		VCMP.F32 S6, #0
			VMRS.F32 APSR_nzcv,FPSCR ; Transfer floating-point flags to the APSR flags
			;sigmoid routine
			VDIV.F32 S20, S21, S20 ; 1/e^x
			VADD.F32 S20, S21, S20 ; 1 + 1/e^x
			VDIV.F32 S20, S21, S20 ; 1/(1 + 1/e^x)
			B OUTPUT
			VDIV.F32 S4, S20, S6 ; sum/i
			;VMUL.F32 S5, S19, S4 ; x*sum/i
			VMUL.F32 S5, S28, S4 ; x*sum/i
			VADD.F32 S20, S21, S5 ; sum = 1 + (x * (sum/i))
			VSUB.F32 S6, S6, S21
			B loop
	


; S15 will hold 0.5 for comparison to finalise the logical output for a particular gate
OUTPUT	VLDR.F32 S15 ,=0.5 ; thresholding to determine if logic 1 or logic 0
		VCMP.F32 S20, S15 ; compare the output of sigmoid routine with S15
		VMRS.F32 APSR_nzcv,FPSCR ; Transfer floating-point flags to the APSR flags
		ITE HI
		MOVHI R3,#1; if S20 > S15
		MOVLS R3,#0; if S20 < S15
		BL printMsg4p	 ; Refer to ARM Procedure calling standards.
	 
stop B stop ; stop program
	 ENDFUNC
	 END
