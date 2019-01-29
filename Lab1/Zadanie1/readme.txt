lab1.1.s - plik zawieraj¹cy kod Ÿród³owy. Na poczatku s¹ zdefiniowane sta³e funkcji i
wywo³ania systemowego. Linijka .text informuje asembler, ¿e od tego momentu zaczyna siê
kod programu. Nastepna linijka czyni etykietê start etykiet¹ globaln¹. Potem wystepuje 
etykieta start, która rozpoczyna program. Nastêpnie wywolana jest funkcja wyswietlajaca 
poczatkowy napis. Nastepnie wpisywana jest dlugosc petli do rejestru ecx, adres pierwszego
i ostatniego napisudo rejestrow eax i ebx. Ignorowane sa znaki przejscia do nowej linii i
konca napisu. Potem w petli s¹ zamieniane s¹ miejscami litery w napisie. Na pocz¹tku
zapisywana jest litera do rejestru dh z adresu, który znajduje siê w rejestrze eax.
Nastêpnie zapisana jest litera z pod adresu znajduj¹cego siê w rejestrze ebx do rejestru
dl. Kolejnymi krokami jest wpisanie litery z rejestru dl do adresu w pamiêci znajduj¹cego
siê w rejestrze eax i litery z dh do adresu z ebx. Nastêpnie dochodzi do dekrementacji 
wartoœci znajduj¹cej siê w rejestrze ebx i inkrementacji wartoœci z rejestru eax, co
odpowiada przejœciu do litery odpowiednio poprzedniej i nastêpnej. Pêtla wykonuje siê a¿
do momentu ca³kowitego odwrócenia napisu. Nastêpnie wywo³ywana jest etykieta pisz poprzez
mnemonik call. Po wykonaniu kodu z etykiety pisz nastepuje zamkniecie programu.
W etykiecie wystêpuje wywo³anie systemowe (tak jak i podczas koñczenia programu). Argumenty
wywo³ania znajduj¹ siê w rejestrach eax, ebx, ecx i edx. W rejestrze eax znajduje siê nr
funkcji systemowej (np 4 to write), w ebx nr wyjœcia, w ecx adres, a w edx d³ugoœæ napisu
do wyœwietlenia. Mnemonik ret oznacza powrót do miejsca z którego zosta³a wywo³ana etykieta
za pomoc¹ kodu call. Od linijki .data zaczynaj¹ siê dane wykorzystane w programie. Pierwsz¹
z nich jest zmienna typu string o etykiecie napis. Jest w niej zapisany napis, który mamy
odwróciæ w programie. Nastêpn¹ zmienn¹ jest len. W niej jest zawarta d³ugoœæ napisu. Jest
ona stworzona poprzez odjêcie aktualnego adresu (adresu zmiennej len) od etykiety napis
(adresu pocz¹tka zmiennej string). Ostatni¹ zmienn¹ jest zmienna len2, której wartoœæ jest
równ¹ po³owie d³ugoœci napisu po odjêciu przejœcia do nowej linii i znaku koñca ci¹gu znaków.

Plik makefile
Pierwsz¹ linijk¹ kodu jest wywo³anie domyœlne (all). Zawiera ono odniesienie do rozkazów
uruchom oraz clean. Rozkaz uruchom potrzebuje pliku lab1.1, wiêc uruchamia rozkaz lab1.1
Rozkaz lab1.1 wywo³uje lab1.1.o. Poniewa¿ plik lab1.1.o nie istniejeto nastêpuje przejœcie
do rozkazu lab1.1.o. Potrzebuje on pliku lab1.1.s, który znajdujesiê w folderze. W zwi¹zku
z tym wykonywana jest komenda znajduj¹ca siê poni¿ej. Odpowiadaona za kompilacjê kodu 
Ÿród³owego (lab1.1.s). Nastêpnie nastêpuje powrót do rozkazu lab1.1 i wykonywany jest 
rozkaz linkowania. Kolejnym krokiem jest powrót do rozkazu uruchom. Polecenie znajduj¹ce
siê tam nakazuje uruchomienie pliku. OStatnim rozkazem jest clean, który usuwa pliki
lab1.1.o oraz lab1.1