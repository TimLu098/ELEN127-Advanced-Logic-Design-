

module CustomAlphabetDecoder(
    input [2:0] input_3bit,
    output reg [6:0] output_7bit
);

always @(*)
begin
    case(input_3bit)
        3'b000: output_7bit = 7'b1110111; // Character A
        3'b001: output_7bit = 7'b1100010; // Character u
        3'b010: output_7bit = 7'b0111001; // Character C
        3'b011: output_7bit = 7'b1011110; // Character d
        3'b100: output_7bit = 7'b0111111; // Character E
        3'b101: output_7bit = 7'b1110001; // Character F
        3'b110: output_7bit = 7'b1100100; // Character something
        3'b111: output_7bit = 7'b1110110; // Character H
        default: output_7bit =7'b0000000; 
    endcase
end

endmodule 