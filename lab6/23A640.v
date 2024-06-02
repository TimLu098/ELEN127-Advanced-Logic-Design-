module M23A640(csb, so, holdb, sck, si);
input csb;
output so;
input holdb;
input sck;
input si;

wire [7:0]dreg;
wire WE;
wire RE;
wire [15:0] address;


spi spi1(csb, sck, si, so, dreg, RE, WE, address);
SRAM sram({address[12:0]}, RE, WE, dreg);

endmodule