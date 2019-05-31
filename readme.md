# Zadanie 2 - obsługa biblioteki FFTW

Program pwostał jako zadanie zaliczeniowe z przedmiotu "Programowanie w języku Fortran". Jest to prgram prezentujący działanie biblioteki FFTW.

## Składowe projektu

Projekt składa się z 2 folderów oraz pliku uruchomieniowego.
```
.
├── src                         #(folder zawierający pliki źródłowe)
    ├── fftw3.F90               #(wrapper tworzący modul linkujący bibliotekę FFTW)
    ├── fftw.F90                #(kod źródłowy pierwszej części zadania (prezentacja działania fft))             
    ├── fftw_filter.F90         #(kod źródłowy drugiej części zadania (odszumianie))
├── res                         #(folder zawierjący wyniki działania)
```

## Sposób użycia
```
./fftw                          #(bezpośrednie uruchomienie pierwszej części zadania)
./fftw_filter                   #(bezpośrednie uruchomienie drugiej części zadania)
make test                       #(uruchmienie za pomocą make)
```

Uruchomienie programu spowoduje wygenerowanie plików wynikowych które zapisane zostaną w folderze /res. Na podstawie tych plików możliwe jest narysowanie wykresów za pomocą dołączonych w folderze /res plików obsługujących narzędzie gnuplot.

## Wyniki działania
Pierwszym podpunktem zadania było przeporwadzenie transformaty na sygnale wygenerowany zgosnie z zadaną funkcją i obserwacja wyników. Na wykresie zauważyć można charaakterystyczne słupki określające maxymalną amplitudę przypadającą na daną częstotliwość, zadana funkcja składała się z dwóch składników dlatego też obserwujemy dwa słupki. Zadana funckja: x(t) = sin(2 * pi * t * 200) + 2 * sin(2 * pi * t * 400) 

![alt text](https://github.com/Marwin34/Fortran_homework_2/blob/master/res/fft_plot.png "Wykres tranformaty dla zadanej funkcji.")

Kolejnym etapem zadania było odszumienie sygnału poswtałego zgodnie z funkcją cosinus.

![alt text](https://github.com/Marwin34/Fortran_homework_2/blob/master/res/noised_cos_plot.png "Wykres zaszumionego sygnału.")

Otrzymany zaszumiany sygna został poddany tranformacie fouriera.

![alt text](https://github.com/Marwin34/Fortran_homework_2/blob/master/res/noised_cos_fft_plot.png "Wykres tranformaty zszumionego sygnału.")

Następnie usunięto wartości dla których amplituda była mniejsza od 50.

![alt text](https://github.com/Marwin34/Fortran_homework_2/blob/master/res/filtered_cos_fft_plot.png "Wykres przefiltrowanej tranformaty.")

Ostatnim krokiem w zdaniu było przeprowadzenie odwrotnej tranformaty na odfiltrowanym wybiku.

![alt text](https://github.com/Marwin34/Fortran_homework_2/blob/master/res/filtered_cos_plot.png "Wykres odszumiony sygnał.")

Na końcu otrzymano odszumiony sygnał który wygląda idealnie jak wykres funkcji cosinus.
    
___

Przykładowe wykresy stworzone narzędziem gnuplot stosując odpowiednie pliki sterujące.

```
res
  ├── plot_fft              #(plik wykresu transformaty)
  ├── plot_noised_cos       #(plik wykresu zaszumionej funkcji)
  ├── plot_noised_cos_fft   #(plik wykresu transformaty zaszumionej funkcji)
  ├── plot_filtered_cos     #(plik wykresu odszumionej tranformaty)
  ├── plot_filtered_cos_fft #(plik wykresu transformaty odszumionej funkcji)
```

## Wnioski
FFT jest bardzo przydantym narzędziem i ma wiele zastosowań (jak chociażby przedstawione odszumianie sygnału). 
