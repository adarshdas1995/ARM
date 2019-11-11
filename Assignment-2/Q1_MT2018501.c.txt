#include <stdio.h>
#include <math.h>
int main()
{
    int x=0;
    float y[100];
    int i;
    printf("\nx\t\ty\n");
    for(i=0;i<=100;i++){
        y[i] = exp(x);
        printf("\t\t\n");
        printf("%d\t\t%f",x,y[i]);
        x++;
        if(x>100) break;
    }

    return 0;
}