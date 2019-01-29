.section .data
.section .text
.globl sse
.type sse, @function
 sse:
	movlps b, %xmm0		#wpisanie dolnej granicy calkowania
	movlps a, %xmm1		#wpisanie gornej granicy calkowania
	subps %xmm1, %xmm0	#roznica granic calkowania (b-a)
	movlps k, %xmm1
	divss %xmm1, %xmm0	#wyznaczenie szerokosci przedzialu (b-a)/k
	movss %xmm0, %xmm7	#przepisanie wyniku dzialania (b-a)/k
	movlhps %xmm7, %xmm7
	movss %xmm0, %xmm7
	movlps n, %xmm6		#xmm6 - nr kroku
	movlps d, %xmm2
	movhps d, %xmm2
	movlps e, %xmm3
	movhps e, %xmm3
calkowanie:
	movss %xmm7, %xmm0
	mulss %xmm6, %xmm0	#pomnozenie przez aktualny krok
	addss a, %xmm0		#dodanie poczatku przedzialu (przesuniecie tak aby
				# bylo calkowane od poczatku przedzialu, a nie od 0) 
	#mulss d, %xmm0		#######################################
	#addss e, %xmm0		# obliczanie 1 prostokata
	#mulss %xmm7, %xmm0	#######################################
	movlhps %xmm0, %xmm0
	addss n, %xmm6		#ustawienie kroku na nastepny

	movss %xmm7, %xmm0
	mulss %xmm6, %xmm0	#pomnozenie przez aktualny krok

	addss a, %xmm0		#dodanie poczatku przedzialu (przesuniecie tak aby
				# bylo calkowane od poczatku przedzialu, a nie od 0) 
	mulps %xmm2, %xmm0	#######################################
	addps %xmm3, %xmm0	# obliczanie 1 prostokata
	mulps %xmm7, %xmm0	#######################################
	addss n, %xmm6		#ustawienie kroku na nastepny
	movss %xmm7, %xmm1
	mulss %xmm6, %xmm1	#pomnozenie przez aktualny krok

	addss a, %xmm1		#dodanie poczatku przedzialu (przesuniecie tak aby
				# bylo calkowane od poczatku przedzialu, a nie od 0) 
	#mulss d, %xmm1		#######################################
	#addss e, %xmm1		# obliczanie 1 prostokata
	#mulss %xmm7, %xmm1
	movlhps %xmm1, %xmm1	#######################################
	addss n, %xmm6		#ustawienie kroku na nastepny
	mulss %xmm6, %xmm1	#pomnozenie przez aktualny krok
	


	movss %xmm7, %xmm1
	mulss %xmm6, %xmm1
	addss a, %xmm1		#dodanie poczatku przedzialu (przesuniecie tak aby
				# bylo calkowane od poczatku przedzialu, a nie od 0) 
	mulps %xmm2, %xmm1	#######################################
	addps %xmm3, %xmm1	# obliczanie 1 prostokata
	mulps %xmm7, %xmm1	#######################################
	addss n, %xmm6		#ustawienie kroku na nastepny
	addps %xmm1, %xmm0
	movhlps %xmm0, %xmm1
	addss %xmm1, %xmm0
	addss %xmm0, %xmm5	
	ucomiss k, %xmm6	#sprawdzanie czy numer kroku (n) jest wiekszy od 
				# ilosci przedzialow (k)
	jna calkowanie		#jesli nie to skok i obliczanie pola kolejnego
				# prostokata
	movlps %xmm5, x
	fld x	
	ret	
 .data
 napis: .asciz "%f \n"
 a: .float 2			#dolna granica calkowania
 b: .float 10			#gorna granica calkowania
 k: .float 100			#ilosc przedzialow na ktore dzielimy obszar calki
 d: .float 2			#f(x)=dx+e
 e: .float 4			#
 n: .float 1			#nr kroku aktualnie wykonywanego
 x: .float 0
 y: .float 0


