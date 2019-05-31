IFORT=ifort -std08 -O3
SRC=fftw.F90
OUT=fftw
LIB=-lfftw3

build: $(SRC)
	$(IFORT) $(SRC) -o $(OUT) $(LIB)

test: $(OUT)
	./$(OUT)