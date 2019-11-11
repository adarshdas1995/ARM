 ;Exponential Series
 
 PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION

	VMOV.F32 S1, #10;value of x
	MOV R1, #30;Number of iterations n
	MOV R4, #1; i
	VMOV.F32 S3, #1; # to store intermediate value t
	VMOV.F32 S4, #1; #to store factorial value
	VMOV.F32 S5, #1; output
	VMOV.F32 S7, #1;
	MOV R8, #1;
Loop 
	 CMP R1, R4;Compare
	 BLT stop; Condition to check to enter inside loop
	 VDIV.F32 S6, S1, S4; #divide x by factorial
	 VMUL.F32 S3, S3, S6; #multiply x*t
	 VADD.F32 S5, S5, S3; #add all terms and save it at S5
	 VADD.F32 S4, S4, S7;#to calculate factorial
	 ADD R4, R4, R8; incrementing count
	 B Loop; 
	 
stop B stop ; stop program
	 ENDFUNC
	 END
