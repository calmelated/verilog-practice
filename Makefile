
all: 
	make -C ALU
	make -C Decode2_4

clean:
	make clean -C ALU 
	make clean -C Decode2_4

