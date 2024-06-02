module bcd_adder (cin, A, B, BCD0, BCD1); 

input cin; 
input [3:0] A, B; 
output [3:0] BCD0, BCD1; 

wire [4:0]sum; 
wire [3:0] remainder; 
wire overflow; 
wire Cout, Least_bit_bcd1; 


adder4 first(A, B, cin, sum[4], sum[3:0]); 
assign overflow = (sum > 5'd9); 
adder4 second (sum[3:0], 4'b0110, 1'b0, Least_bit_bcd1, remainder); 

assign BCD0   = overflow? remainder : sum; 
assign BCD1  = overflow? 4'b0001 : 4'b0000; 


endmodule 