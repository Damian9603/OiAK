all: uruchom clean
#uruchomienie programu
uruchom: lab1.1
	./lab1.1		# uruchamianie programu

# regu³a linkowania
lab1.1: lab1.1.o #
	ld -o lab1.1 lab1.1.o # linkowanie pliku lab1.1.o

# regu³a kompilacji
lab1.1.o: lab1.1.s #
	as -o lab1.1.o lab1.1.s # asemblacja pliku lab1.1.s 
clean:
	rm -rf lab1.1.o	lab1.1	# usuniecie pliku lab1.1.o i lab1.1

