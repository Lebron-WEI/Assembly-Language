#include<stdio.h>

unsigned int shld5(unsigned int a, unsigned int b)
{
	unsigned int result;
	asm("shll $5, %%edx\n\t"
        "shrl $27, %%ecx\n\t"
		"orl  %%ecx, %%edx\n\t"
        "movl %%edx, %%eax"
		:"=a"(result)
		:"d"(a),"c"(b));
	return result;
}

int main()
{	int a=1;
	int b=1000;
	int result;
    result = shld5(a, b);
	printf("%d\n",result);
	return 0;
}