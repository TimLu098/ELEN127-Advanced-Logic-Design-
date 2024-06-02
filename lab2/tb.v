
module testbench();

reg [3:0] a, b, e, f; //a=a1, b=a0, e= b1, f = b0
reg c;
wire [3:0] bcd0, bcd1, bcd2, bcd3;

bcd_adder one(c, b, f, bcd0, bcd3);
bcd_adder two(bcd3[0], a, e, bcd1, bcd2);

initial begin
	$display("Start of the bcd adder test");
	$monitor("ab=%d%d, ef=%d%d, cin = %d, bcd=%d%d%d, @ %d", a, b, e, f, c, bcd2, bcd1, bcd0, $time);

a = 4'd1; b=4'd2; e = 4'd5; f=4'd0; c = 0; 
#10
a = 4'd2; b=4'd0; e = 4'd5; f=4'd0; c = 0; 
#10
a = 4'd6; b=4'd2; e = 4'd6; f=4'd3; c = 0; 
#10
a = 4'd1; b=4'd3; e = 4'd2; f=4'd6; c = 0; 
#10
a = 4'd2; b=4'd3; e = 4'd3; f=4'd3; c = 1; 
#10
a = 4'd9; b=4'd9; e = 4'd9; f=4'd9; c = 0; 
#10
a = 4'd9; b=4'd9; e = 4'd9; f=4'd8; c = 1; 
#10
a = 4'd9; b=4'd9; e = 4'd9; f=4'd9; c = 1; 
#10
a = 4'd0; b=4'd0; e = 4'd0; f=4'd0; c = 0; 
#10
$display("End of the bcd adder test");
$finish;

end

endmodule 
