module tbSram();

  reg [12:0] address; // Register addresses
  reg RE; // Data to be written
  reg WE; 
  wire [7:0] Data; // Data read from registers
  

  // Instantiate the RegisterFile module
  SRAM uut (
	address,
	RE,
	WE,
	Data
    );
	reg [7:0] din;
	
	assign Data = din;

  // Initial values
  initial begin
    $monitor("# %t, address= %h : RE = %b  WE = %b Data = %x",
  $time, address,
	RE,
	WE,
	Data
	);

	address <= 13'b0000000000000;
 	din = 8'h60;
	#1
	WE <= 1'b1; 
	RE <= 1'b0;
	#5
	WE <= 1'b0; 
	RE <= 1'b0;
	#1

	address <= 13'b0000000000001;
 	din = 8'h20;
	#1
	WE <= 1'b1; 
	RE <= 1'b0;
	#5
	WE <= 1'b0; 
	RE <= 1'b0;
	#5;


	address <= 13'b0000000000000;
 	//din = 8'bZZZZZZZZ;
	#1
	WE <= 1'b0; 
	RE <= 1'b1;
	#5
	WE <= 1'b0; 
	RE <= 1'b0;
	#5;

	

	address <= 13'b0000000000001;
	din = 8'bZZZZZZZZ;
	#1
	WE <= 1'b0; 
	RE <= 1'b1;
	#5
	WE <= 1'b0;
	RE <= 1'b0;
	#5;
	
	$finish;
	end
endmodule 

