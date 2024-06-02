
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
  reg [7:0] write_data_registers [0:7];
  reg write_enable_reg0, write_enable_reg1, write_enable_reg2, write_enable_reg3;
  reg write_enable_reg4, write_enable_reg5, write_enable_reg6, write_enable_reg7;

  // Instantiate EightbitRegister modules for each of the 8 registers
  EightbitRegister regs [7:0] (
    .D(write_data_registers[0]),
    .clock(clk),
    .En(write_enable_reg0),
    .Q(registerIn[0])
  );

  // Create individual write enable signals for each register
  always @(posedge clk) begin
    if (write_enable && (write_addr == 3'b000)) begin
      write_enable_reg0 <= 1'b1;
      write_data_registers[0] <= write_data;
    end else begin
      write_enable_reg0 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b001)) begin
      write_enable_reg1 <= 1'b1;
      write_data_registers[1] <= write_data;
    end else begin
      write_enable_reg1 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b010)) begin
      write_enable_reg2 <= 1'b1;
      write_data_registers[2] <= write_data;
    end else begin
      write_enable_reg2 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b011)) begin
      write_enable_reg3 <= 1'b1;
      write_data_registers[3] <= write_data;
    end else begin
      write_enable_reg3 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b100)) begin
      write_enable_reg4 <= 1'b1;
      write_data_registers[4] <= write_data;
    end else begin
      write_enable_reg4 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b101)) begin
      write_enable_reg5 <= 1'b1;
      write_data_registers[5] <= write_data;
    end else begin
      write_enable_reg5 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b110)) begin
      write_enable_reg6 <= 1'b1;
      write_data_registers[6] <= write_data;
    end else begin
      write_enable_reg6 <= 1'b0;
    end

    if (write_enable && (write_addr == 3'b111)) begin
      write_enable_reg7 <= 1'b1;
      write_data_registers[7] <= write_data;
    end else begin
      write_enable_reg7 <= 1'b0;
    end
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