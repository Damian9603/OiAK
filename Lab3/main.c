#include <stdio.h>

const long long unsigned CPU=4;

long long unsigned my_cpuid(unsigned);



int main(void)
{
	int a=0;
	long long unsigned t;
	t=my_cpuid(a);
	int x=0;
	t=my_cpuid(a)-t;
	printf ("%llu",t/CPU);
	printf (" ns\n");
	return x;
}

