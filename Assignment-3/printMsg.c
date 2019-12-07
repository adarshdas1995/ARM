#include "stm32f4xx.h"
#include <string.h>
void printHEAD1(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n ********LOGIC FUNCTION:AND********");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }

	 void printHEAD2(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n ********LOGIC FUNCTION:OR*********");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }

void printHEAD3(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n ********LOGIC FUNCTION:NOT********");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }	

void printHEAD4(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n ********LOGIC FUNCTION:NAND*******");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }	 

void printHEAD5(const int a)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg,"\n ********LOGIC FUNCTION:NOR********");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   }	 

void printMsg2p(const int a, const int b)
{
	 char Msg[100];
	 char *ptr;
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
}

void printMsg4p(const int a, const int b, const int c, const int d)
{
	 char Msg[100];
	 char *ptr;
	 // Printing the first input X1
	sprintf(Msg,"\n X1:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the second input X2
	 sprintf(Msg,"\t X2:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", b);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the third input X2
	 sprintf(Msg,"\t X3:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", c);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 // Printing the OUTPUT Y
	 sprintf(Msg,"\t Y:");
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 sprintf(Msg, "%x", d);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
	 }
	
}
