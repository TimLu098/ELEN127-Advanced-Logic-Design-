module testbench();

reg [2:0] charval0;
reg [2:0] charval1;
reg [2:0] charval2;
reg [2:0] charval3;

wire [6:0] sega;
wire [6:0] segb;
wire [6:0] segc;
wire [6:0] segd;

reg [1:0] sel;


wire [2:0] a;
wire [2:0] b;
wire [2:0] c;
wire [2:0] d;



//three_to_7segment theta(a, sega);
//three_to_7segment theta1(b, segb);



four_to1_mux one(charval3, charval2, charval1, charval0, sel, a);
four_to1_mux two(charval2, charval3, charval0, charval1, sel, b);
four_to1_mux three(charval1, charval0, charval3, charval2, sel, c);
four_to1_mux four(charval0, charval1, charval2, charval3, sel, d);


CustomAlphabetDecoder theta(a, sega);
CustomAlphabetDecoder theta1(b, segb);
three_to_7segment theta2(c, segc);
three_to_7segment theta3(d, segd);




initial begin
	$display("Start of the decoder test");
	$monitor("sel = %d, charval0=%d, charval1=%d,charval2=%d,charval3=%d, sega=%b,segb=%b, segc=%b, segd=%b, @ %d", sel, charval0, charval1, charval2, charval3, sega, segb, segc, segd, $time);
charval0 = 3'd0; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd3;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd2; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd1;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd6; charval1 = 3'd1; charval2 = 3'd0; charval3 = 3'd7;
sel = 0;
#10
sel = 3'd1;
#10
sel = 3'd2;
#10
sel = 3'd3;
#10
charval0 = 3'd0; charval1 = 3'd1; charval2 = 3'd2; charval3 = 3'd3;
sel = 0;
#10
charval0 = 3'd1;
#10
charval0 = 3'd2;
#10
charval0 = 3'd3;
#10
charval1 = 3'd7;
#10
charval1 = 3'd6;
#10
charval1 = 3'd5;
#10
$finish;

end

endmodule

