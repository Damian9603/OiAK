all: uruchom clean
uruchom: lab2.1
	gdb lab2.1		# uruchamianie programu

# reguła linkowania
lab2.1: lab2.1.o #
	ld -o lab2.1 lab2.1.o # linkowanie pliku lab2.1.o

# reguła kompilacji
lab2.1.o: lab2.1.s #
	as --gstabs+ -o lab2.1.o lab2.1.s # asemblacja pliku lab2.1.s 
#uruchomienie programu
clean:
	rm -rf lab2.1.o	lab2.1	# usuniecie pliku lab2.1.o
