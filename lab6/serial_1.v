module spi(
    input csb,
    input sck,
    input si,
    output reg so,
    inout [7:0] io,
    output reg re,
    output reg we,
    output reg [15:0] address
);

    reg [7:0] inst;
    reg [7:0] dreg;

    reg [5:0] customState;

    reg [7:0] readreg;
    reg readop;

    assign write_instruction = (inst == 8'b00000010);
    assign read_instruction = (inst == 8'b00000011);
    assign io[7:0] = write_instruction ? dreg[7:0] : 8'bzzzzzzzz;
/*
    reg [7:0] io_temp;
    assign io= io_temp;*/

    always @(posedge sck) begin
       // io_temp = 0; 
        if (~csb) begin
            case (customState)
                0, 1, 2, 3, 4, 5, 6, 7: inst[7:0] <= {inst[6:0], si};
                8, 9, 10, 11, 12, 13, 14, 15, 
                16, 17, 18 ,19, 20, 21, 22, 23: address[15:0] <= {address[14:0], si};
                24, 25, 26, 27, 28, 29, 30, 31:
                    begin
                        if (write_instruction)
                            dreg[7:0] <= {dreg[6:0], si};  
                    end
                default: ;
            endcase
        end

        if (customState == 11)
            readop = (address[1:0] == 0);

        if ((inst == 8'b00000011) & (customState == 23) & readop) 
            re <= 1;
        else
            re <= 0;

        if ((inst == 8'b00000010) & (~csb))
            we <= 1;
        else
            we <= 0;

        if (customState < 33)
            customState <= customState + 1; 
    end

    always @(negedge sck) begin
        if (~csb & read_instruction & readop) begin
            case (customState)
                24: begin
                    so <= io[7]; 
                    readreg <= {io[6:0], 1'b0}; 
                end
                25, 26, 27, 28, 29, 30, 31: begin
                    so <= readreg[7];
                    readreg[7:0] <= {readreg[6:0], 1'b0};
                end
                default: so <= 1'bZ;
            endcase
        end
    end

    always @(negedge csb) begin
        customState <= 1'b0;
        so <= 1'bZ;
    end

endmodule
