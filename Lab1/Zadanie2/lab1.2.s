EXIT = 1				#Stale, nr funkcji restartu
WRITE = 4				#nr funkcji wyjscia
STDOUT = 1				#nr wyjscia standardowego (monitor)
SYSCALL32 = 0x80 			#nr wywolania systemowego
 .text
 .global _start
 _start:
	call pisz	
	movl $len, %ecx			#wpisanie dlugosci petli do ecx
	movl $napis, %eax		#wpisanie adresu napisu do rejestru eax

sprawdzenie:				#etykieta poczatku petli
	mov (%eax), %dh
	mov $0x40, %dl
	cmp %dl, %dh
	ja warunek2
powrot:
	inc %eax			#przejscie do nastepnego znaku w pierwszej czesci
	loop sprawdzenie		#skok do poczatku petli pod warunkiem, ze wynikiem dekrementacji nie bylo 0
	call pisz
        movl $EXIT, %eax		#wpisanie nr funkcji systemowej odpowiadajacej za zamkniecie programu
        movl $0, %ebx			#argument powyzszej funkcji
        int $SYSCALL32			#wywolanie przerwania w celu zakonczenia programu
warunek2:
	mov $0x5A, %dl
	cmp %dl, %dh
	jbe zmniejszanie
	jmp powrot
zmniejszanie:
	add $0x20, %dh
	mov %dh, (%eax)
	jmp powrot
pisz:
        movl $WRITE, %eax		#wpisanie 4 do rejestru eax(nr funkcji systemowej write)
        movl $STDOUT, %ebx		#wpisanie 1 do rejestru ebx(nr wyjscia, 1=standardowe)
        movl $napis, %ecx		#skopiowanie adresu danych do wyswietlenia do rejestru ecx
        movl $len, %edx			#skopiowanie dlugosci napisu do edx
        int $SYSCALL32			#wywolanie przerwana w celu wyswietlenia napisu
	ret				#powrot do miejsca w ktorym zostal uzyty rozkaz call

 .data
 napis:					#etykieta zmiennej napisu
        .string "HeLLo WORlD\n"	#tworzenie zmiennej, w ktorej jest zapisany napis
 len = . - napis			#zmienna zawierajaca dlugosc napisu
 
 