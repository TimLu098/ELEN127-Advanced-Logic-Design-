module SRAM(
	input [12:0] Address,
	input RE,
	input WE,
	inout [7:0] Data
);

	reg[7:0] RAM [0:8191];
	
	
	
	assign Data = (RE) ? RAM[Address] : 8'bZZZZZZZZ;

	always @(posedge WE)
	begin 
		RAM[Address] <= Data; 
	end


endmodule
