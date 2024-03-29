
     THUMB
	  AREA     test, CODE, READONLY
	  IMPORT printMsg
      EXPORT __main
      ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 

;Degree to radian conversion
      
       VLDR.F32 s31, =5 ; degrees of difference 
       VLDR.F32 s30, =180	   
	   VLDR.F32 s21, =-180
loop1  BL sinecosine
       VADD.F32 s21,s21,s31
 
	   VLDR.F32 s29,=200 ;radius  pixels

       VMUL.F32 s28,s29,s7 ; x = r*cos()

       VMUL.F32 s29,s29,s5 ; y = r * sin()

;change origin (0.0) to (239,319)

       VLDR.F32 s27, =239
       VLDR.F32 s26, =319
	   
      VADD.F32 s28,s28,s27 ; add offset to x
      VADD.F32 s29,s29,s26 ; add offset to y


;   VCVT.U32.F32 s28,s28 ;Uncomment for Y
     VCVT.U32.F32 s29,s29 ; X values

;	VMOV.F32 R0,S28	; Uncomment for Y
   VMOV.F32 R0,S29 ; X values
       BL printMsg	 ; Print Values
   
       VCMP.F32 s21,s30
	   vmrs APSR_nzcv,FPSCR ; for floating to floating point comparision
	   BLE loop1



;Store X value in radian
;      VLDR.F32 s0, =1

	
sinecosine ;Sine Cosine function

;store pie value
       VLDR.F32 s22, =3.14159
       VLDR.F32 s23, =180
       VDIV.F32 s24,s22,s23;  (pi/180)
       VMUL.F32 s0,s24,s21	
	
	
	
;Store no of iterations
      MOV R0,#0x00000020
	 
;iterations	count i
      VLDR.F32 s2, =1
	  MOV R1,#0x00000001
;increment i	  
	  VLDR.F32 s3, =1
	  MOV R2,#0x00000001


;Product_sin s4	 
	  VMOV.F32 s4, s0

;result_sin s5	 
	  VMOV.F32 s5, s0
	  
;Product_cos s6	 
	  VLDR.F32 s6, =1

;result_cos s7	 
	  VLDR.F32 s7, =1	  

;x * x is calculated
   VMUL.F32 s8,s0,s0

;to calculate 2 * i 
	  VLDR.F32 s9, =2

Loop  

;iterate product_sin x * x/ 2i * 2i+1 ----stored in s13 

      VMUL.F32 s10,s2,s9
      VADD.F32 s11,s10,s3
      VMUL.F32 s12,s10,s11
      VDIV.F32 s13,s8,s12
      
      VSUB.F32 s14,s10,s3
      VMUL.F32 s15,s10,s14 ; 2i * 2i-1
      ;iterate product_sin x * x/ 2i * 2i+1 ----stored in s13 
      VDIV.F32 s16,s8,s15
      
      ;Product_sin s4	
      VNMUL.F32 s4,s4,s13 
      
      ;Product_cos s6	
      VNMUL.F32 s6,s6,s16 
      
      ;sine_result
      VADD.F32 s5,s5,s4
      
      ;cos_result
      VADD.F32 s7,s7,s6

      VADD.F32 s2,s2,s3
	  ADD R1,R1,R2
	  CMP R1,R0	
	  BLT Loop
      BX lr

	
stop    B stop ; stop program
      ENDFUNC
      END 