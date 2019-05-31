# Zadanie 2 - obsługa biblioteki FFTW

Program pwostał jako zadanie zaliczeniowe z przedmiotu "Programowanie w języku Fortran". Jest to prgram prezentujący działanie biblioteki FFTW.

## Składowe projektu

Projekt składa się z 2 folderów oraz pliku uruchomieniowego.
```
.
├── src                         #(folder zawierający pliki źródłowe)
    ├── ./fftw                  #(plik uruchomieniowy programu)
├── res                         #(folder zawierjący wyniki działania)
```

## Sposób użycia
```
./fftw                          #(bezpośrednie uruchomienie)
make test                       #(uruchmienie za pomocą make)
```

Uruchomienie programu spowoduje wygenerowanie plików wynikowych które zapisane zostaną w folderze /res. Na podstawie tych plików możliwe jest narysowanie wykresów za pomocą dołączonych w folderze /res plików obsługujących narzędzie gnuplot.

## Wyniki działania
<center>

<object data="https://github.com/Marwin34/Fortran_homework_2/blob/master/res/fft_plot.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/Marwin34/Fortran_homework_2/blob/master/res/fft_plot.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="https://github.com/Marwin34/Fortran_homework_2/blob/master/res/fft_plot.pdf">Download PDF</a>.</p>
    </embed>
</object>

_Wykres przedstawiający wynik działania funkcji fftw_execute_dft_r2c._
</center>

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
