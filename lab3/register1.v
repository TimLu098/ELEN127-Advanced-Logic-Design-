module EightbitRegister(
	input wire [7:0] D,
	input wire clock, 
	input wire En,
	output reg [7:0] Q
);
	always @(posedge clock) begin
		if (En) begin
			Q <= D;
		end
	end
endmodule


//the write_enable is globally, need to write one reg at a time 
module RegisterFile(
	input wire clk,
	input [2:0] read_addr0,
	input [2:0] read_addr1,
	input wire [2:0] write_addr,
	input wire [7:0] write_data,
	input write_enable,
	output reg [7:0] read_data0,
	output reg [7:0] read_data1
);
	
	wire [0:7] registerIn [7:0];
	
    reg [7:0] write_signal; // Declare a reg for write signal


always @(*) begin
    //write_signal = write_enable; // Assign the value of En to write_signal

    case (write_addr) 
        3'b000: write_signal = 8'b00000001;
        3'b001: write_signal = 8'b00000010;
        3'b010: write_signal = 8'b00000100;
        3'b011: write_signal = 8'b00001000;
        3'b100: write_signal = 8'b00010000;
        3'b101: write_signal = 8'b00100000; 
        3'b110: write_signal = 8'b01000000; 
        3'b111: write_signal = 8'b10000000; 
        default: write_signal = 8'b00000000; 
    endcase
end

// Instantiate EightbitRegister modules for each of the_enable 
            
  	EightbitRegister regs0 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[0]),
    	.Q(registerIn[0])
  	);

	EightbitRegister regs1 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[1]),
    	.Q(registerIn[1])
  	);

	EightbitRegister regs2 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[2]),
    	.Q(registerIn[2])
  	);
	EightbitRegister regs3 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[3]),
    	.Q(registerIn[3])
  	);
	EightbitRegister regs4 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[4]),
    	.Q(registerIn[4])
  	);
	EightbitRegister regs5 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[5]),
    	.Q(registerIn[5])
  	); 
	EightbitRegister regs6 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[6]),
    	.Q(registerIn[6])
  	);
	EightbitRegister regs7 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_signal[7]),
    	.Q(registerIn[7])
	);

// Use write_signal in the decoder
always @(*) begin
	//write_signal = write_enable;
    case (read_addr0)
        3'b000: read_data0 = (write_enable && (write_addr == 3'b000)) ? write_data : registerIn[0];
        3'b001: read_data0 = (write_enable && (write_addr == 3'b001)) ? write_data : registerIn[1];
        3'b010: read_data0 = (write_enable && (write_addr == 3'b010)) ? write_data : registerIn[2];
        3'b011: read_data0 = (write_enable && (write_addr == 3'b011)) ? write_data : registerIn[3];
        3'b100: read_data0 = (write_enable && (write_addr == 3'b100)) ? write_data : registerIn[4];
        3'b101: read_data0 = (write_enable && (write_addr == 3'b101)) ? write_data : registerIn[5];
        3'b110: read_data0 = (write_enable && (write_addr == 3'b110)) ? write_data : registerIn[6];
        3'b111: read_data0 = (write_enable && (write_addr == 3'b111)) ? write_data : registerIn[7];
        default: read_data0 = 8'bzzzzzzzz; 
    endcase
end


always @(*) begin
	//write_signal = write_enable;
    case (read_addr1)
        3'b000: read_data1 = (write_enable && (write_addr == 3'b000)) ? write_data : registerIn[0];
        3'b001: read_data1 = (write_enable && (write_addr == 3'b001)) ? write_data : registerIn[1];
        3'b010: read_data1 = (write_enable && (write_addr == 3'b010)) ? write_data : registerIn[2];
        3'b011: read_data1 = (write_enable && (write_addr == 3'b011)) ? write_data : registerIn[3];
        3'b100: read_data1 = (write_enable && (write_addr == 3'b100)) ? write_data : registerIn[4];
        3'b101: read_data1 = (write_enable && (write_addr == 3'b101)) ? write_data : registerIn[5];
        3'b110: read_data1 = (write_enable && (write_addr == 3'b110)) ? write_data : registerIn[6];
        3'b111: read_data1 = (write_enable && (write_addr == 3'b111)) ? write_data : registerIn[7];
        default: read_data1 = 8'bzzzzzzzz; 
    endcase
end 


endmodule







/*
// Use write_signal in the decoder
always @(*) begin
	write_signal = write_enable;
    case (read_addr0)
        3'b000: read_data0 = (write_signal[0] && (write_addr == 3'b000)) ? write_data : registerIn[0];
        3'b001: read_data0 = (write_signal[1] && (write_addr == 3'b001)) ? write_data : registerIn[1];
        3'b010: read_data0 = (write_signal[2] && (write_addr == 3'b010)) ? write_data : registerIn[2];
        3'b011: read_data0 = (write_signal[3] && (write_addr == 3'b011)) ? write_data : registerIn[3];
        3'b100: read_data0 = (write_signal[4] && (write_addr == 3'b100)) ? write_data : registerIn[4];
        3'b101: read_data0 = (write_signal[5] && (write_addr == 3'b101)) ? write_data : registerIn[5];
        3'b110: read_data0 = (write_signal[6] && (write_addr == 3'b110)) ? write_data : registerIn[6];
        3'b111: read_data0 = (write_signal[7] && (write_addr == 3'b111)) ? write_data : registerIn[7];
        default: read_data0 = 8'bxxxxxxxx; 
    endcase
end

always @(*) begin
	write_signal = write_enable;
    // Similar logic for read_data1 using write_signal
    case (read_addr1)
        3'b000: read_data1 = (write_signal[0] && (write_addr == 3'b000)) ? write_data : registerIn[0];
        3'b001: read_data1 = (write_signal[1] && (write_addr == 3'b001)) ? write_data : registerIn[1];
        3'b010: read_data1 = (write_signal[2] && (write_addr == 3'b010)) ? write_data : registerIn[2];
        3'b011: read_data1 = (write_signal[3] && (write_addr == 3'b011)) ? write_data : registerIn[3];
        3'b100: read_data1 = (write_signal[4] && (write_addr == 3'b100)) ? write_data : registerIn[4];
        3'b101: read_data1 = (write_signal[5] && (write_addr == 3'b101)) ? write_data : registerIn[5];
        3'b110: read_data1 = (write_signal[6] && (write_addr == 3'b110)) ? write_data : registerIn[6];
        3'b111: read_data1 = (write_signal[7] && (write_addr == 3'b111)) ? write_data : registerIn[7];
        default: read_data1 = 8'bxxxxxxxx; 
    endcase
end*/

/*
// Use write_signal in the decoder
always @(*) begin
	write_signal = write_enable;
    case (read_addr0)
        3'b000: read_data0 = registerIn[0];
        3'b001: read_data0 = registerIn[1];
        3'b010: read_data0 = registerIn[2];
        3'b011: read_data0 = registerIn[3];
        3'b100: read_data0 = registerIn[4];
        3'b101: read_data0 = registerIn[5];
        3'b110: read_data0 = registerIn[6];
        3'b111: read_data0 = registerIn[7];
        default: read_data0 = 8'bxxxxxxxx; 
    endcase
end
always @(*) begin
	write_signal = write_enable;
    case (read_addr0)
        3'b000: read_data1 = registerIn[0];
        3'b001: read_data1 = registerIn[1];
        3'b010: read_data1 = registerIn[2];
        3'b011: read_data1 = registerIn[3];
        3'b100: read_data1 = registerIn[4];
        3'b101: read_data1 = registerIn[5];
        3'b110: read_data1 = registerIn[6];
        3'b111: read_data1 = registerIn[7];
        default: read_data1 = 8'bxxxxxxxx; 
    endcase
end*/