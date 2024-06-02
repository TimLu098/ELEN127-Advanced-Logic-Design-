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

  wire [7:0] registerIn[0:7];
  reg write_enable_reg0, write_enable_reg1, write_enable_reg2, write_enable_reg3;
  reg write_enable_reg4, write_enable_reg5, write_enable_reg6, write_enable_reg7;

  // Instantiate EightbitRegister modules for each of the 8 registers
  EightbitRegister regs [7:0] (
    .D(write_data),
    .clock(clk),
    .En((write_enable && (write_addr == 3'b000)) ? 1'b1 : 1'b0),
    .Q(registerIn[0])
  );

  // Create individual write enable signals for each register
  always @(posedge clk) begin
    write_enable_reg0 <= (write_enable && (write_addr == 3'b000)) ? 1'b1 : 1'b0;
    write_enable_reg1 <= (write_enable && (write_addr == 3'b001)) ? 1'b1 : 1'b0;
    write_enable_reg2 <= (write_enable && (write_addr == 3'b010)) ? 1'b1 : 1'b0;
    write_enable_reg3 <= (write_enable && (write_addr == 3'b011)) ? 1'b1 : 1'b0;
    write_enable_reg4 <= (write_enable && (write_addr == 3'b100)) ? 1'b1 : 1'b0;
    write_enable_reg5 <= (write_enable && (write_addr == 3'b101)) ? 1'b1 : 1'b0;
    write_enable_reg6 <= (write_enable && (write_addr == 3'b110)) ? 1'b1 : 1'b0;
    write_enable_reg7 <= (write_enable && (write_addr == 3'b111)) ? 1'b1 : 1'b0;
  end

  // Read
  always @* begin
    if (read_addr0 == write_addr) begin
      read_data0 = write_data;
    end else begin
      read_data0 = registerIn[read_addr0];
    end
  end

  always @* begin
    if (read_addr1 == write_addr) begin
      read_data1 = write_data;
    end else begin
      read_data1 = registerIn[read_addr1];
    end
  end
endmodule
