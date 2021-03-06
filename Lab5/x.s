.section .data
.section .text
.globl calka
.type calka, @function
 calka:
	fstcw control		##############################################
	mov control, %ax	# wymuszenie korzystania z float
	sub $768, %ax		# nalezy odjac 768 aby bylo float
	mov %ax, control	# nalezy odjac 256 aby byly double
	fldcw control		##############################################
	fild k			#wpisanie ilosci przedzialow do rejestru
	fild a			#wpisanie dolnej granicy calkowania
	fild b			#wpisanie gornej granicy calkowania
	fsub			#roznica granic calkowania (b-a)
	fdiv			#wyznaczenie szerokosci przedzialu (b-a)/k
	fld %st(0)		#skopiowanie dlugosci przedzialu
	mov $n, %ecx		#wpisanie adresu zmiennej n (aktualnego kroku)
	movl $1, (%ecx)		#ustawienie aktualnego kroku na 1
	mov k, %eax		#wczytanie ilosci przedzialow
	mov $2, %ebx
calkowanie:
	fld %st(1)		#przepisanie wyniku dzialania (b-a)/k
	fimul (%ecx)		#pomnozenie przez aktualny 
	fiadd a			#dodanie poczatku przedzialu (przesuniecie tak aby
				# bylo calkowane od poczatku przedzialu, a nie od 0) 
	fimul d			#######################################
	fiadd e			# obliczanie 1 prostokata
	fmul %st(2)		#######################################
	add $1,(%ecx)		#ustawienie kroku na nastepny
	cmp $2,(%ecx)		#sprawdzenie czy petla wykonywana jest 1 raz
	jnz dodawanie		#jesli nie to obliczona wartosc jest dodawana do
				# sumy pol poprzednich przedzialow
powrot:
	cmp %eax, (%ecx)	#sprawdzanie czy numer kroku (n) jest wiekszy od 
				# ilosci przedzialow (k)
	jna calkowanie		#jesli nie to skok i obliczanie pola kolejnego
				# prostokata
	ret
dodawanie:
	fadd			#dodawanie st0 (obliczonego pola prostokata) i st1
				# (sumy poprzednich pol)
	jmp powrot
	
 .data
 napis: .asciz "%f \n"
 a: .int 2			#dolna granica calkowania
 b: .int 10			#gorna granica calkowania
 k: .int 101			#ilosc przedzialow na ktore dzielimy obszar calki
 wynik: .float			#zmienna w ktorej zostanie zapisany wynik
 d: .int 2			#f(x)=dx+e
 e: .int 4			#
 n: .int 0			#nr kroku aktualnie wykonywanego
 control: .int 0

