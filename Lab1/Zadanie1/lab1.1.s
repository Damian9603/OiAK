EXIT = 1				#Stale, nr funkcji restartu
WRITE = 4				#nr funkcji wyjscia
STDOUT = 1				#nr wyjscia standardowego (monitor)
SYSCALL32 = 0x80 			#nr wywolania systemowego
 .text					#od tego momentu zaczyna sie kod programu
 .global _start				#etykieta start jest etykieta globalna
 _start:
	call pisz
		
	movl $len2, %ecx		#wpisanie dlugosci petli do ecx
	movl $napis, %eax		#wpisanie adresu napisu do rejestru eax
	movl $napis, %ebx		#wpisanie adresu ostatniego znaku (pomijany jest
	add $len-3, %ebx		#kod konca znaku i przejscia do nowej linii)

zamiana:				#etykieta poczatku petli
	mov (%eax), %dh			#zapisanie znaku z pierwszej czesci napisu do rejestru dh
	mov (%ebx), %dl			#zapisanie znaku z drugiej czesci napisu do rejestru
	mov %dh,(%ebx)			#wpisanie znaku do drugiej czesci napisu
	mov %dl,(%eax)			#wpisanie znaku do pierwszej czesci napisu
	dec %ebx			#przejscie do poprzedniego znaku w drugiej czesci
	inc %eax			#przejscie do nastepnego znaku w pierwszej czesci
	loop zamiana			#skok do poczatku petli pod warunkiem, ze wynikiem dekrementacji nie bylo 0

        call pisz

        movl $EXIT, %eax		#wpisanie nr funkcji systemowej odpowiadajacej za zamkniecie programu
        movl $0, %ebx			#argument powyzszej funkcji
        int $SYSCALL32			#wywolanie przerwania w celu zakonczenia programu
 
pisz:
	movl $WRITE, %eax		#wpisanie 4 do rejestru eax(nr funkcji systemowej write)
        movl $STDOUT, %ebx		#wpisanie 1 do rejestru ebx(nr wyjscia, 1=standardowe)
        movl $napis, %ecx		#skopiowanie adresu danych do wyswietlenia do rejestru ecx
        movl $len, %edx			#skopiowanie dlugosci napisu do edx
        int $SYSCALL32			#wywolanie przerwana w celu wyswietlenia napisu
	ret				#powrot do miejsca w ktorym zostal uzyty rozkaz call

 .data					#od tego momentu zaczynaja sie dane w programie
 napis:					#etykieta zmiennej napisu
        .string "hello world!\n"	#tworzenie zmiennej, w ktorej jest zapisany napis
 len = . - napis			#zmienna zawierajaca dlugosc napisu
 len2= (len-1)/2			#zmienna zawierajaca polowe dlugosci napisu zaokraglona w dol
					#(ignorowany jest znak konca napisu)
 
 