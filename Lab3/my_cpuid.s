.section .data
.section .text
.globl my_cpuid
.type my_cpuid, @function

my_cpuid:
	push %rbp		#inicjalizacja stostu
	mov %rsp, %rbp		#ustawienie wierzcholka na jedyny element, ktory sie tam znajduje
	cmp $0, %rax
	je zero			#skok jesli podane zostalo 0 do funkcji
	cmp $1, %rax
	je jeden		#skok jesli podane zostalo 1 do funcji
	jmp else		#skok gdy cokolwiek innego zostalo podane
#gdy argument podany do funkcji jest rowny 0
zero:
	sub $4, %rsp		#zrobienie miejsca na stosie dla zmiennej lokalnej przez 
	mov -4(%rbp), %ecx	#przesuniecie wskaznika aktualnego elementu stosu
petla:
	mov $0, %rcx
	rdtsc
	inc %eax
	jl petla		#skok, gdy druga wartosc jest mniejsza niz pierwsza wartosc
	jmp koniec
#gdy argument podany do funkcji jest rowny 1
jeden:
	xor %eax, %eax
	cpuid
	rdtsc
	jmp koniec
#gdy argument podany do funkcji ma inna wartosc
else:
	rdtscp
	jmp koniec

koniec:
	mov %rbp, %rsp
	pop %rbp
	ret

	
