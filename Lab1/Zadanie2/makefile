all: uruchom clean
uruchom: lab1.2
	./lab1.2		# uruchamianie programu

# regu³a linkowania
lab1.2: lab1.2.o #
	ld -o lab1.2 lab1.2.o # linkowanie pliku lab1.2.o

# regu³a kompilacji
lab1.2.o: lab1.2.s #
	as -o lab1.2.o lab1.2.s # asemblacja pliku lab1.2.s 
#uruchomienie programu
clean:
	rm -rf lab1.2.o	lab1.2	# usuniecie pliku lab1.2.o i lab1.2

