#include <stdio.h>

const long long unsigned CPU=4;

long long unsigned my_cpuid(unsigned);
float calka();

float sse();


int main(void)
{
	int a=0;
	float x,y;
	long long unsigned t0, t1, t2;
	t0=my_cpuid(a);
	y=calka();
	t1=my_cpuid(a)-t0;
	x=sse();
	t2=my_cpuid(a)-t1-t0;
	float t=(float)t1/(float)t2;
	printf ("FPU: %llu\n",t1);
	printf ("SSE: %llu\n",t2);
	printf ("Stosunek czasu wykonania: %f\n",t);
	printf ("Wynik calki FPU: %f\n", y);
	printf ("Wynik calki SSE: %f\n", x);
	return x;
}

