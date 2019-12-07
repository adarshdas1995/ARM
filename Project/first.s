 ;gender classification based on the python program attached
 
;start of program
 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
     IMPORT printMsg4p
	 ENTRY 
__main  FUNCTION
        ; load input values
		VLDR.F32 S29,= 4 ; height
		VLDR.F32 S30,= 40;weight
		VLDR.F32 S31,=1
		
		;to display it we have to store input in registers
		MOV R0,#4
		MOV R1,#40
		
		;for more than 1 task from same dataset you could use switch case statement
		;ADR.W  R6, BranchTable_Byte 
		;MOV R7,#0 ; to select one option in switch case (gates)
		;TBB   [R6, R7] ; switch case equivalent in Arm cortex M4 
		
		
		;weights initialization ;S0 = W0,S1 = W1 S2 = (Bias) as provided in the python code
		VLDR.F32 S0,=-4.39
		VLDR.F32 S1,=-12.24
		VLDR.F32 S2,= 1.28
		B EXP_X_CALCULATION


;S28 will store the final X0*W0 + X1*W1 + Bias
EXP_X_CALCULATION	VMLA.F32 S28, S0, S31
					VMLA.F32 S28, S1, S29
					VMLA.F32 S28, S2, S30
					B SIGN


; sign activation function
SIGN	VLDR.F32 S15 ,=0 ; thresholding 
		VCMP.F32 S28, S15 ; compare the output 
		VMRS.F32 APSR_nzcv,FPSCR ; Transfer floating-point flags to the APSR flags
		ITE HI
		MOVHI R2,#1; if S28 > S15 i.e. if greater than zero then male according to python code
		MOVLS R2,#2; if S28 < S15 i.e. if less than zero then female according to python code
		BL printMsg4p	 ; Refer to ARM Procedure calling standards.
	 
stop B stop ; stop program
	 ENDFUNC
	 END
		 ;Note: please note that the actual python program was trained on only 8 input.
		 ;[4.5,35], [4.9,38], [5.0,45], [4.8,49], [5.8,59], [5.6,65], [5.7, 73], [5.8,82]
		 ; in our case for unseen data [4,40] it is providing right output
		 ;hence, model shows generalization
		 ;NOTE: here we have assumed that female has less height and weight compaired to male
	