
all: 
	make -C ALU
	make -C Decode2_4
	make -C Mux4_1
	make -C FullAddr

clean:
	make clean -C ALU 
	make clean -C Decode2_4
	make clean -C Mux4_1
	make clean -C FullAddr

