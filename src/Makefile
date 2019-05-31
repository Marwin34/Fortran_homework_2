IFORT=ifort -std08 -O3 -check bounds
SRC=fftw.F90
MOD_SRC=fftw3.F90
FILTER_SRC=fftw_filter.F90
OUT=fftw
FILTER_OUT=fftw_filter
LIB=-lfftw3

build: $(SRC)
	$(IFORT) -c $(MOD_SRC)
	$(IFORT) $(SRC) -o $(OUT) $(LIB)
	$(IFORT) $(FILTER_SRC) -o $(FILTER_OUT) $(LIB)

test: $(OUT)
	./$(OUT)
	./$(FILTER_OUT)

clean:
	rm -rf *.o $(OUT) $(FILTER_OUT)