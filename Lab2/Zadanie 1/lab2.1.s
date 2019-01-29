EXIT = 1				#Stale, nr funkcji restartu
SYSCALL32 = 0x80 			#nr wywolania systemowego
 .text
 .global _start
 _start:	
	movl $wynik1, %eax		#adres zmiennej, w ktorej przechowywana jest pierwsza liczba
	mov $1, %dh			#wpisanie wartosci 1 do zmiennej tablicowej
	mov %dh, 255(%eax)		#

	movl $wynik2, %eax		#kroki analogiczne do powyzszych	
	mov $1, %dh
	mov %dh, 255(%eax)

 dodawanie:
	movl $wynik1, %eax		#zapisanie adresu 1 zmiennej do eax i ustawienie adresu w rejestrze na ostatnia cyfre zmiennej
	add $255, %eax			#
	movl $wynik2, %ebx		#analogiczne czynnosci do 2 zmiennej
	add $255, %ebx			#
	call add_be			#wywolanie funkcji dodajacej 2 liczby w Big Endian
	
	movl $wynik2, %eax		#kroki analogiczne do powyzszych
	add $255, %eax
	movl $wynik1, %ebx
	add $255, %ebx
	call add_be

	mov $0x80, %dh			#sprawdzenie czy najbardziej znaczaca cyfra jest wieksza od 8 
	mov wynik2, %dl			#(zapobiega przepelnieniu i przeklamaniu wartosci ostatnich liczb ciagu Fibonnaciego
	cmp %dh, %dl			#zapisanych na 2048 bitach)
	ja koniec
	jmp dodawanie
 koniec:
        movl $EXIT, %eax		#zakonczenie programu
        movl $0, %ebx			
        int $SYSCALL32			
 add_be:
	mov $256, %ecx			#ilosc okrazen petli zalezna od ilosci cyfr szesnastkowych (dla liczby 2048 bitowej jest to 253)	
	clc
	mov $0, %edx
 add_be_outer_loop:
	mov %dh, %dl			#przypisanie przesuniecia z poprzedniego dodawania 
	mov $0, %dh			
	add (%ebx), %dl			#dodanie wartosci 2 cyfr z drugiej zmiennej do dl
	add (%eax), %dl			#dodanie wartosci 2 cyfr z pierwszej zmiennej do dl
	jc warunek			#skok jesli bylo przeniesienie
 w_pow:
	mov %dl, (%eax)			#zapisanie wyniku dodawania w pierwszej tablicy
	dec %eax			#przejscie do kolejnych cyfr
	dec %ebx
	loop add_be_outer_loop
	ret

 warunek:
	mov $1, %dh			#zapamietanie przeniesienia w rejestrze dh
	jmp w_pow			#powrot do dodawania
 .data
 wynik1:  .skip 256 			#niezainicjowana tablica 128 liczb 2-bajtowych, pierwsza zmienna, w ktorej sa zapisywane kolejne liczby ciagu Fibonacciego
 wynik2:  .skip 256 			#druga zmienna, w ktorej sa zapisywane kolejne liczby ciagu Fibonacciego
 
