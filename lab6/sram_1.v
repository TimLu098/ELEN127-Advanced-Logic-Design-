module SRAM (
        input [12:0] Address,
        input RE,
        input WE,
        inout [7:0] Data
);

        reg [7:0] RAM [0:8191];
        reg read_flag;

        assign Data = (read_flag) ? RAM[Address] : 8'bZ;

        always @(posedge WE) begin
                RAM[Address] <= Data;
        end

        always @(posedge RE) begin
                read_flag <= 1;
        end

        always @(negedge RE) begin
                read_flag <= 0;
        end

endmodule