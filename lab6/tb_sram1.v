module tbSram();

  reg [12:0] address; 
  reg RE; 
  reg WE; 
  wire [7:0] Data;
  reg [7:0]DataIn;
  SRAM uut (
	address,
	RE,
	WE,
	Data
    ); 
  assign Data = DataIn;
  initial begin
    $monitor("# %t, address= %d : RE = %d  WE = %d Data = %d",
  $time, address,
	RE,
	WE,
	Data);
	#5;
	address = 13'd0;
	DataIn = 8'bZ;
	WE <= 1'b0;
	RE <= 1'b0;
	
	#5;
	address = 13'd0;
	DataIn = 8'd5;
	WE <= 1'b1;
	RE <= 1'b0;


	#5;
	address = 13'd1;
	DataIn = 8'd8;
	WE <= 1'b1;
	RE <= 1'b0;

	#5;
	address = 13'd0;
	DataIn = 8'bZ;
	WE <= 1'b0;
	RE <= 1'b1;
	#5;
	address = 13'd1;
	DataIn = 8'bZ;
	WE <= 1'b0;
	RE <= 1'b0;
	#5;
	address = 13'd1;
	DataIn = 8'bZ;
	WE <= 1'b0;
	RE <= 1'b1;

	#5;
	address = 13'd1;
	DataIn = 8'd8;
	WE <= 1'b1;
	RE <= 1'b0;

	
	#5;
	address = 13'd1;
	DataIn = 8'd6;
	WE <= 1'b1;
	RE <= 1'b0;

	#5;
	address = 13'd1;
	DataIn = 8'bZ;
	WE <= 1'b0;
	RE <= 1'b1;
	#5;


	$finish;
	end
	
endmodule 