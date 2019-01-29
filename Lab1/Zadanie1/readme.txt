lab1.1.s - plik zawieraj�cy kod �r�d�owy. Na poczatku s� zdefiniowane sta�e funkcji i
wywo�ania systemowego. Linijka .text informuje asembler, �e od tego momentu zaczyna si�
kod programu. Nastepna linijka czyni etykiet� start etykiet� globaln�. Potem wystepuje 
etykieta start, kt�ra rozpoczyna program. Nast�pnie wywolana jest funkcja wyswietlajaca 
poczatkowy napis. Nastepnie wpisywana jest dlugosc petli do rejestru ecx, adres pierwszego
i ostatniego napisudo rejestrow eax i ebx. Ignorowane sa znaki przejscia do nowej linii i
konca napisu. Potem w petli s� zamieniane s� miejscami litery w napisie. Na pocz�tku
zapisywana jest litera do rejestru dh z adresu, kt�ry znajduje si� w rejestrze eax.
Nast�pnie zapisana jest litera z pod adresu znajduj�cego si� w rejestrze ebx do rejestru
dl. Kolejnymi krokami jest wpisanie litery z rejestru dl do adresu w pami�ci znajduj�cego
si� w rejestrze eax i litery z dh do adresu z ebx. Nast�pnie dochodzi do dekrementacji 
warto�ci znajduj�cej si� w rejestrze ebx i inkrementacji warto�ci z rejestru eax, co
odpowiada przej�ciu do litery odpowiednio poprzedniej i nast�pnej. P�tla wykonuje si� a�
do momentu ca�kowitego odwr�cenia napisu. Nast�pnie wywo�ywana jest etykieta pisz poprzez
mnemonik call. Po wykonaniu kodu z etykiety pisz nastepuje zamkniecie programu.
W etykiecie wyst�puje wywo�anie systemowe (tak jak i podczas ko�czenia programu). Argumenty
wywo�ania znajduj� si� w rejestrach eax, ebx, ecx i edx. W rejestrze eax znajduje si� nr
funkcji systemowej (np 4 to write), w ebx nr wyj�cia, w ecx adres, a w edx d�ugo�� napisu
do wy�wietlenia. Mnemonik ret oznacza powr�t do miejsca z kt�rego zosta�a wywo�ana etykieta
za pomoc� kodu call. Od linijki .data zaczynaj� si� dane wykorzystane w programie. Pierwsz�
z nich jest zmienna typu string o etykiecie napis. Jest w niej zapisany napis, kt�ry mamy
odwr�ci� w programie. Nast�pn� zmienn� jest len. W niej jest zawarta d�ugo�� napisu. Jest
ona stworzona poprzez odj�cie aktualnego adresu (adresu zmiennej len) od etykiety napis
(adresu pocz�tka zmiennej string). Ostatni� zmienn� jest zmienna len2, kt�rej warto�� jest
r�wn� po�owie d�ugo�ci napisu po odj�ciu przej�cia do nowej linii i znaku ko�ca ci�gu znak�w.

Plik makefile
Pierwsz� linijk� kodu jest wywo�anie domy�lne (all). Zawiera ono odniesienie do rozkaz�w
uruchom oraz clean. Rozkaz uruchom potrzebuje pliku lab1.1, wi�c uruchamia rozkaz lab1.1
Rozkaz lab1.1 wywo�uje lab1.1.o. Poniewa� plik lab1.1.o nie istniejeto nast�puje przej�cie
do rozkazu lab1.1.o. Potrzebuje on pliku lab1.1.s, kt�ry znajdujesi� w folderze. W zwi�zku
z tym wykonywana jest komenda znajduj�ca si� poni�ej. Odpowiadaona za kompilacj� kodu 
�r�d�owego (lab1.1.s). Nast�pnie nast�puje powr�t do rozkazu lab1.1 i wykonywany jest 
rozkaz linkowania. Kolejnym krokiem jest powr�t do rozkazu uruchom. Polecenie znajduj�ce
si� tam nakazuje uruchomienie pliku. OStatnim rozkazem jest clean, kt�ry usuwa pliki
lab1.1.o oraz lab1.1