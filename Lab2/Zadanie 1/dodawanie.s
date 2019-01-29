EXIT = 1				#Stale, nr funkcji restartu
WRITE = 4				#nr funkcji wyjscia
STDOUT = 1				#nr wyjscia standardowego (monitor)
SYSCALL32 = 0x80 			#nr wywolania systemowego
 .text
 .global _start
 _start:	
	movl $16, %ecx			#wpisanie dlugosci petli do ecx
	movl $wynik1, %eax		#wpisanie adresu napisu do rejestru eax

	mov $0x9A, %dh
	mov %dh, 127(%eax)
	mov %dh, 8(%eax)
	mov $0xFE, %dh
	mov %dh, 7(%eax)
	mov %dh, (%eax)
	mov $0x34, %dh
	mov %dh, 125(%eax)
	mov $0x12, %dh
	mov %dh, 124(%eax)

	call le_to_be

	movl $16, %ecx			#wpisanie dlugosci petli do ecx
	movl $wynik2, %eax		#wpisanie adresu napisu do rejestru eax
	mov $0x67, %dh
	mov %dh, 127(%eax)
	mov %dh, 8(%eax)
	mov $0xFF, %dh
	mov %dh, (%eax)
	mov %dh, 7(%eax)
	mov $0x23, %dh
	mov %dh, 125(%eax)
	mov $0x01, %dh
	mov %dh, 124(%eax)
	call le_to_be


	call add_be
	
        movl $EXIT, %eax		#wpisanie nr funkcji systemowej odpowiadajacej za zamkniecie programu
        movl $0, %ebx			#argument powyzszej funkcji
        int $SYSCALL32			#wywolanie przerwania w celu zakonczenia programu
 le_to_be:
 ltb_outer_loop:
	movl $i, %ebx
	movl %ecx, (%ebx)
	mov $7, %ebx
	mov %eax, %ecx
	add %ebx, %ecx
 ltb_inner_loop:
	mov (%eax), %dh
	mov (%ecx), %dl
	mov %dl, (%eax)
	mov %dh, (%ecx)

	inc %eax
	dec %ecx
	dec %ebx
	cmp $3, %ebx
	jne ltb_inner_loop
	add $4, %eax
	mov i, %ecx
	loop ltb_outer_loop
	ret
 add_be:
	mov $16, %ecx
	mov %ecx, i
	movl $wynik1, %eax
	add $136, %eax
	movl $wynik2, %ebx
	add $136, %ebx
	clc
 add_be_outer_loop:
	mov %ecx, i
	mov $8, %ecx
	sub $16, %eax
	sub $16, %ebx
 add_be_inner_loop:
	mov %dh, %dl
	mov $0, %dh
	add (%ebx), %dl
	add (%eax), %dl
	jc warunek
 w_pow:
	mov %dl, (%eax)
	inc %eax
	inc %ebx
	loop add_be_inner_loop
	mov i, %ecx
	loop add_be_outer_loop
	ret

 warunek:
	mov $1, %dh
	jmp w_pow
 .data
 wynik1:  .skip 128			#niezainicjowana tablica 128 liczb 2-bajtowych
 wynik2:  .skip 128
 i: .int 0
 
 
 