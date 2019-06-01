IFORT=ifort -std08 -O3 -check bounds
SRC=src/fftw.F90
MOD_SRC=src/fftw3.F90
FILTER_SRC=src/fftw_filter.F90
OUT=fftw
FILTER_OUT=fftw_filter
LIB=-lfftw3

build: $(SRC) $(MOD_SRC) $(FILTER_SRC)
	$(IFORT) -c $(MOD_SRC)
	$(IFORT) $(SRC) -o $(OUT) $(LIB)
	$(IFORT) $(FILTER_SRC) -o $(FILTER_OUT) $(LIB)

test: $(OUT)
	./$(OUT)
	./$(FILTER_OUT)

clean:
	rm -rf *.o $(OUT) $(FILTER_OUT)