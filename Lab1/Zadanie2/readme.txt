lab1.2.s
Pocz�tek pliku jest analogiczny do pliku lab1.1.s. Na pocz�tku znajduje mnemonik call, kt�ry
wykonuje skok do etykiety wypisuj�cej napis, w kt�rym wielkie litery powinny by� zamienione
na ma�e. Nast�pnie do rejestru ecx wpisywana jest d�ugo�� p�tli, kt�ra jest r�wna d�ugo�ci
napisu. Do rejestru eax wprowadzony jest adres etykiety napis, czyli adres pocz�tku
zmiennej string. Nast�pnie rozpoczynana jest p�tla, w kt�rej s� pobierane kolejne litery
napisu do rejestru dh, sprawdzane jest czy s� wi�ksze lub r�wne A za pomoc� wpisania 
wpisania warto�ci litery A do rejestru dl i por�wnania ich za pomoc� mnemonika cmp. 
Nast�pnie wykonuje si� skok warunkowy do etykiety warunek 2 je�li warto�� kodu ASCII jest 
wi�ksza od A. Po ew skoku do rejestru dl wpisany jest kod ASCII litery Z i wykonywane jest
por�wnanie warto�ci kodu ASCII pobranej litery i Z. Je�li jest wi�ksza wykonuje si� skok
do etykiety zmniejszanie, je�li nie to wykonuje si� skok do etykiety powr�t co jest
r�wnoznaczne z powrotem do p�tli. Po ew skoku do etykiety zmniejszanie nast�puje dodanie do
rejestru dh licby 20H co oznacza zmian� litery z wielkiej na ma�� i wpisanie j� w miejsce,
kt�re wskazuje rejestr eax, czyli w miejsce, z kt�rego zosta�a pobrana. Nast�pnie nast�puje
skok do etykiety powr�t, czyli nast�puje powr�t do p�tli. Nast�pnie nast�puje inkrementacja
eax, co oznacza przej�cie do kolejnej litery oraz dekrementacja licznika i skok do etykiety
sprawdzenie. Po wykonaniu p�tli nast�puje wy�wietlenie rezulatu i zako�czenie programu.