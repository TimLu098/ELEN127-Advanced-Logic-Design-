module tb();

reg clk;
reg reset;
reg [1:0] stick;

wire L_outer, L_middle, L_inner, R_inner, R_middle, R_outer;

Controller dut(
	clk,
	reset,
	stick,
	L_outer,
  	L_middle,
  	L_inner,
  	R_inner,
  	R_middle,
  	R_outer  
);

always begin
#5 clk = ~clk;
$display("clk=%b, reset =%b, stick=%b, L_outer=%b,L_middle=%b,L_inner=%b,R_inner=%b,R_middle=%b,R_outer=%b,  @ %d", clk, reset, stick, L_outer, L_middle, L_inner, R_inner, R_middle, R_outer, $time);
#5 clk = ~clk;
end

initial begin
	$display("Start of test");
clk <= 0;
#1
reset <= 1'b1; stick <= 2'b00; #10
reset <= 1'b0; stick <= 2'b00; #10

reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10


reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10

reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10

reset <= 1'b1; stick <= 2'b10; #10

reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10
reset <= 1'b0; stick <= 2'b10; #10

reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10

reset <= 1'b1; stick <= 2'b01; #10

reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10
reset <= 1'b0; stick <= 2'b01; #10

	$finish;
end
endmodule