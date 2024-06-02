//verilog moudle for 3 bit to 7 segment 

module three_to_7segment (c, out);
input [2:0] c;
output reg [6:0] out;


always @(*)
    begin
    case(c)
    3'b000 : out = 7'b1100000;
    3'b001 : out = 7'b1000010;
    3'b010 : out = 7'b1100010; 
    3'b011 : out = 7'b1100011;
    3'b100 : out = 7'b1100111;
    3'b101 : out = 7'b1101111;
    3'b110 : out = 7'b1110111;
    3'b111 : out = 7'b0111111;
    endcase
    end

endmodule


