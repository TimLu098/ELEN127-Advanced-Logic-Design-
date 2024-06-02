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
	input wire write_enable,
	output reg [7:0] read_data0,
	output reg [7:0] read_data1
);
	
	reg [7:0] registerIn;
	

// Instantiate EightbitRegister modules for each of the 8 registers
  	EightbitRegister regs0 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[0])
  	);

	EightbitRegister regs1 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[1])
  	);

	EightbitRegister regs2 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[2])
  	);
	EightbitRegister regs3 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[3])
  	);
	EightbitRegister regs4 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[4])
  	);
	EightbitRegister regs5 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[5])
  	); 
	EightbitRegister regs6 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[6])
  	);
	EightbitRegister regs7 (
    	.D(write_data),
    	.clock(clk),
    	.En(write_enable),
    	.Q(registerIn[7] )
  	);


reg write_signal; // Declare a reg for write signal

// Write Data Logic
always @(*) begin
    write_signal = write_enable; // Assign the value of En to write_signal

    if (write_enable) begin
        case (write_addr)
            3'b000: write_signal = 1'b1; // Set write_signal for the corresponding register
            3'b001: write_signal = 1'b1;
            3'b010: write_signal = 1'b1;
            3'b011: write_signal = 1'b1;
            3'b100: write_signal = 1'b1;
            3'b101: write_signal = 1'b1;
            3'b110: write_signal = 1'b1;
            3'b111: write_signal = 1'b1;
            default: write_signal = 1'b0; // Default to 0 for other cases
        endcase
    end
end

// Use write_signal in the decoder
always @(*) begin
    case (read_addr0)
        0: read_data0 = (write_signal && (write_addr == 3'b000)) ? write_data : registerIn[0];
        1: read_data0 = (write_signal && (write_addr == 3'b001)) ? write_data : registerIn[1];
        2: read_data0 = (write_signal && (write_addr == 3'b010)) ? write_data : registerIn[2];
        3: read_data0 = (write_signal && (write_addr == 3'b011)) ? write_data : registerIn[3];
        4: read_data0 = (write_signal && (write_addr == 3'b100)) ? write_data : registerIn[4];
        5: read_data0 = (write_signal && (write_addr == 3'b101)) ? write_data : registerIn[5];
        6: read_data0 = (write_signal && (write_addr == 3'b110)) ? write_data : registerIn[6];
        7: read_data0 = (write_signal && (write_addr == 3'b111)) ? write_data : registerIn[7];
        default: read_data0 = 8'bxxxxxxxx; 
    endcase
end

always @(*) begin
    // Similar logic for read_data1 using write_signal
    case (read_addr1)
        0: read_data1 = (write_signal && (write_addr == 3'b000)) ? write_data : registerIn[0];
        1: read_data1 = (write_signal && (write_addr == 3'b001)) ? write_data : registerIn[1];
        2: read_data1 = (write_signal && (write_addr == 3'b010)) ? write_data : registerIn[2];
        3: read_data1 = (write_signal && (write_addr == 3'b011)) ? write_data : registerIn[3];
        4: read_data1 = (write_signal && (write_addr == 3'b100)) ? write_data : registerIn[4];
        5: read_data1 = (write_signal && (write_addr == 3'b101)) ? write_data : registerIn[5];
        6: read_data1 = (write_signal && (write_addr == 3'b110)) ? write_data : registerIn[6];
        7: read_data1 = (write_signal && (write_addr == 3'b111)) ? write_data : registerIn[7];
        default: read_data1 = 8'bxxxxxxxx; 
    endcase
end

endmodule


/*
module RegisterFile(
    input wire clk,
    input [2:0] read_addr0,
    input [2:0] read_addr1,
    input wire [2:0] write_addr,
    input wire [7:0] write_data,
    input wire write_enable,
    output reg [7:0] read_data0,
    output reg [7:0] read_data1
);

// Instantiate EightbitRegister modules for each of the 8 registers
EightbitRegister regs[7:0] (
    .D(write_data),
    .clock(clk),
    .En({write_enable, write_enable, write_enable, write_enable, write_enable, write_enable, write_enable, write_enable}),
    .Q({read_data0, read_data1, read_data2, read_data3, read_data4, read_data5, read_data6, read_data7})
);

// Write Data Logic
always @(posedge clk) begin
    if (write_enable) begin
        case (write_addr)
            3'b000: regs[0].D <= write_data;
            3'b001: regs[1].D <= write_data;
            3'b010: regs[2].D <= write_data;
            3'b011: regs[3].D <= write_data;
            3'b100: regs[4].D <= write_data;
            3'b101: regs[5].D <= write_data;
            3'b110: regs[6].D <= write_data;
            3'b111: regs[7].D <= write_data;
        endcase
    end
end

// Read Data Logic
always @(*) begin
    // Read Data Logic for read_data0 (same as before)
    case (read_addr0)
        0: read_data0 = regs[0].Q;
        1: read_data0 = regs[1].Q;
        2: read_data0 = regs[2].Q;
        3: read_data0 = regs[3].Q;
        4: read_data0 = regs[4].Q;
        5: read_data0 = regs[5].Q;
        6: read_data0 = regs[6].Q;
        7: read_data0 = regs[7].Q;
        default: read_data0 = 8'bxxxxxxxx; // Uninitialized value when read address is invalid
    endcase

    // Read Data Logic for read_data1 (same as before)
    case (read_addr1)
        0: read_data1 = regs[0].Q;
        1: read_data1 = regs[1].Q;
        2: read_data1 = regs[2].Q;
        3: read_data1 = regs[3].Q;
        4: read_data1 = regs[4].Q;
        5: read_data1 = regs[5].Q;
        6: read_data1 = regs[6].Q;
        7: read_data1 = regs[7].Q;
        default: read_data1 = 8'bxxxxxxxx; // Uninitialized value when read address is invalid
    endcase
end

endmodule

*/


