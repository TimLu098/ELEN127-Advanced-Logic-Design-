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
    reg readop; // the signal to check the read operation
    
    
    /*
    reg [7:0] io_temp;
    wire [7:0] io_recv;

    assign io= io_temp;
    assign io_recv = io;
*/
    assign io[7:0] = (inst == 8'b00000010) ? dreg[7:0] : 8'bZZZZZZZZ;


    

    always @(posedge sck) begin
        
       // io_temp = 8'b0; 

        if (~csb) begin
          case (customState)
            //shift in the instruction bits
            0: inst[7:0] <= {inst[6:0], si};
            1: inst[7:0] <= {inst[6:0], si};
            2: inst[7:0] <= {inst[6:0], si};
            3: inst[7:0] <= {inst[6:0], si};
            4: inst[7:0] <= {inst[6:0], si};
            5: inst[7:0] <= {inst[6:0], si};
            6: inst[7:0] <= {inst[6:0], si};
            7: inst[7:0] <= {inst[6:0], si};

            
            
            // shift in the address bits
            8: address[15:0] <= {address[14:0], si};
            9: address[15:0] <= {address[14:0], si};
            10: address[15:0] <= {address[14:0], si};
            11: address[15:0] <= {address[14:0], si};
            12: address[15:0] <= {address[14:0], si};
            13: address[15:0] <= {address[14:0], si};
            14: address[15:0] <= {address[14:0], si};
            15: address[15:0] <= {address[14:0], si};
            16: address[15:0] <= {address[14:0], si};
            17: address[15:0] <= {address[14:0], si};
            18: address[15:0] <= {address[14:0], si};
            19: address[15:0] <= {address[14:0], si};
            20: address[15:0] <= {address[14:0], si};
            21: address[15:0] <= {address[14:0], si};
            22: address[15:0] <= {address[14:0], si};
            23: address[15:0] <= {address[14:0], si}; 

        
            //shift in data for write operations
            24: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si};
                end  
            25: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                end 
            26: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                end 
            27: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                end
            28: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                end
            29: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                end
            30: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                end
            31: begin
                if (inst == 8'b00000010)
                    dreg[7:0] <= {dreg[6:0], si}; 
                customState <= 0;

                end 
            

                default: ;
            endcase

        end
     
        // Determine if it is a read operation based on the lower bits of the address
        readop = (customState == 11) ? (address[1:0] == 0) : readop; 

        //if it is read operation then enable read output
        re <= (inst == 8'b00000011) && (customState == 23) && readop ? 1 : 0;
        
        // check if it is a write operation and enable write output
        we <= (inst == 8'b00000010) && (customState == 31) && (~csb) ? 1 : 0;

        // increment the state machine counter
       customState <= (customState < 33) ? (customState + 1) : customState;

    end  


    always @(negedge sck) begin 
    if (~csb && (inst== 8'b00000011) && readop) begin //if it operate read
        case (customState)
            24: begin
                so <= io[7];
                readreg <= {io[6:0], 1'b0};
            end
        
            25: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
            end
            26: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
            end
            27: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
            end
            28: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
            end
            29: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
            end
            30: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
            end
            31: begin
                so <= readreg[7];
                readreg[7:0] <= {readreg[6:0], 1'b0};
                customState <= 0; 
            end

            default: so <= 1'bz;
        endcase
    end
end 



always @(negedge csb)
  begin
    customState <= 1'b0;				
						
    so <= 1'bZ;
  end


endmodule



