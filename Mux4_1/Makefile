
CC = C:/iverilog/bin/iverilog.exe
VVP = C:/iverilog/bin/vvp.exe
RM = C:/UnxUtils/usr/local/wbin/rm.exe
SRC = $(CURDIR)/mux4_1

all: $(SRC).v
	$(CC) -o $(SRC) $(SRC).v
	$(VVP) $(SRC)

clean:
	$(RM) -f $(SRC)
	$(RM) -f $(SRC).vcd

