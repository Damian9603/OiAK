lab1.2.s
Pocz¹tek pliku jest analogiczny do pliku lab1.1.s. Na pocz¹tku znajduje mnemonik call, który
wykonuje skok do etykiety wypisuj¹cej napis, w którym wielkie litery powinny byæ zamienione
na ma³e. Nastêpnie do rejestru ecx wpisywana jest d³ugoœæ pêtli, która jest równa d³ugoœci
napisu. Do rejestru eax wprowadzony jest adres etykiety napis, czyli adres pocz¹tku
zmiennej string. Nastêpnie rozpoczynana jest pêtla, w której s¹ pobierane kolejne litery
napisu do rejestru dh, sprawdzane jest czy s¹ wiêksze lub równe A za pomoc¹ wpisania 
wpisania wartoœci litery A do rejestru dl i porównania ich za pomoc¹ mnemonika cmp. 
Nastêpnie wykonuje siê skok warunkowy do etykiety warunek 2 jeœli wartoœæ kodu ASCII jest 
wiêksza od A. Po ew skoku do rejestru dl wpisany jest kod ASCII litery Z i wykonywane jest
porównanie wartoœci kodu ASCII pobranej litery i Z. Jeœli jest wiêksza wykonuje siê skok
do etykiety zmniejszanie, jeœli nie to wykonuje siê skok do etykiety powrót co jest
równoznaczne z powrotem do pêtli. Po ew skoku do etykiety zmniejszanie nastêpuje dodanie do
rejestru dh licby 20H co oznacza zmianê litery z wielkiej na ma³¹ i wpisanie j¹ w miejsce,
które wskazuje rejestr eax, czyli w miejsce, z którego zosta³a pobrana. Nastêpnie nastêpuje
skok do etykiety powrót, czyli nastêpuje powrót do pêtli. Nastêpnie nastêpuje inkrementacja
eax, co oznacza przejœcie do kolejnej litery oraz dekrementacja licznika i skok do etykiety
sprawdzenie. Po wykonaniu pêtli nastêpuje wyœwietlenie rezulatu i zakoñczenie programu.