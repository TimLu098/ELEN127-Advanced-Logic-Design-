module Testbench();

  reg clk; // Clock signal
  reg [2:0] read_addr0, read_addr1, write_addr; // Register addresses
  reg [7:0] write_data; // Data to be written
  reg write_en; 
  wire [7:0] read_data0, read_data1; // Data read from registers

  // Instantiate the RegisterFile module
  RegisterFile uut (
    clk,
    read_addr0,
    read_addr1,
    write_addr,
    write_data,
    write_en,
    read_data0,
    read_data1
    );

  // Clock generation 
  always begin
    #5
    clk = !clk;
  end

  // Initial values
  initial begin
    clk = 0;
    $monitor("# %t, write_en= %d : wr_addr = %d  wr_data = %d rd_addr0 = %d rd_addr1 = %d rd_data0 = %d rd_data1 = %d",
  $time, write_en, write_addr, write_data, read_addr0, read_addr1, read_data0, read_data1);
    //bypass mode
    read_addr0 = 3'b000; 
    read_addr1 = 3'b001; 
    write_addr = 3'b000; 
    write_data = 204;
    write_en = 1'b1; 
    #5;
    read_addr0 = 3'b001; 
    read_addr1 = 3'b001; 
    write_addr = 3'b001; 
    write_data = 13;  
    write_en = 1'b1; 
    #5;
    read_addr0 = 3'b010; 
    read_addr1 = 3'b010; 
    write_addr = 3'b010; 
    write_data = 204;
    write_en = 1'b0; 
    #5;
    read_addr0 = 3'b011; 
    read_addr1 = 3'b011; 
    write_addr = 3'b011; 
    write_data = 100;
    write_en = 1'b1; 
    #5;
    read_addr0 = 3'b100; 
    read_addr1 = 3'b100; 
    write_addr = 3'b100; 
    write_data = 150;
    write_en = 1'b1; 
    #5;
    read_addr0 = 3'b101; 
    read_addr1 = 3'b101; 
    write_addr = 3'b101; 
    write_data = 20;
    write_en = 1'b1; 
    #5;
    read_addr0 = 3'b110; 
    read_addr1 = 3'b110; 
    write_addr = 3'b110; 
    write_data = 120;
    write_en = 1'b1; 
    #5;
    read_addr0 = 3'b111; 
    read_addr1 = 3'b111; 
    write_addr = 3'b111; 
    write_data = 30;
    write_en = 1'b1; 
    #5;
     read_addr0 = 3'b111; 
    read_addr1 = 3'b110; 
    write_addr = 3'b111; 
    write_data = 45;
    write_en = 1'b0; 
    #5;
     read_addr0 = 3'b110; 
    read_addr1 = 3'b000; 
    write_addr = 3'b000; 
    write_data = 40;
    write_en = 1'b0; 
    #5;


    $finish;
  end

endmodule

