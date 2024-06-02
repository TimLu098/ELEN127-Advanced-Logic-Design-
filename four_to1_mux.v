module four_to1_mux (A, B, C, D, sel, mux_out);
input [2:0] A, B, C, D;
input [1:0] sel;
output [2:0] mux_out;


wire [2:0] w1, w2;

assign w1 = sel[0] ? D : C;
assign w2 = sel[0] ? B : A;
assign mux_out = sel[1] ? w2 : w1;


endmodule

