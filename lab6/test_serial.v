module tb_spi();

    reg csb;
    reg sck;
    reg si;
    wire so;
    wire [7:0] io;
    wire re;
    wire we;
    wire [15:0] address;
    reg anyfail;
    reg fail;
    reg [7:0] dreg;
    reg so_1;
    
    // Instantiate the spi module
    spi uut (
        .csb(csb),
        .sck(sck),
        .si(si),
        .so(so),
        .io(io),
        .re(re),
        .we(we),
        .address(address)
    );

    //to do inout connection 
    reg [7:0] io_drive;
    wire [7:0] io_recv;

    assign io = io_drive;
    assign io_recv = io;

    //reg [7:0] read_out;
    //reg [7:0] read_out1;
    
      


initial begin
 
      anyfail = 0;
        so_1 = so;
        so_1 = 0;
        si = 0;
        sck = 0;
        csb = 1;

        // Write data
        #10 sck = 1;
        #10 sck = 0;
        
        write(16'h0003, 8'h56);
        write(16'h0031, 8'h75);
      
        #10 $display("Write Enable: %b", we);
        
        read(16'h0003,dreg);
        read(16'h0031,dreg);
        #10 sck = 1; #10 sck = 0;
        #10 sck = 1; #10 sck = 0;
        $display("Read Enable: %b", re);
    
  $finish;
  end


task write(input [15:0] address, input [7:0] data);
  begin
    csb = 0;				// Start Transaction
    si = 0; #5 sck = 1; 		// Send write instruction 0000 0010
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 1; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;

    #5 si = address[15]; sck = 0; #5 sck = 1;	// Send address MSB first
    #5 si = address[14]; sck = 0; #5 sck = 1;
    #5 si = address[13]; sck = 0; #5 sck = 1;
    #5 si = address[12]; sck = 0; #5 sck = 1;
    #5 si = address[11]; sck = 0; #5 sck = 1;
    #5 si = address[10]; sck = 0; #5 sck = 1;
    #5 si = address[9]; sck = 0; #5 sck = 1;
    #5 si = address[8]; sck = 0; #5 sck = 1;
    #5 si = address[7]; sck = 0; #5 sck = 1;
    #5 si = address[6]; sck = 0; #5 sck = 1;
    #5 si = address[5]; sck = 0; #5 sck = 1;
    #5 si = address[4]; sck = 0; #5 sck = 1;
    #5 si = address[3]; sck = 0; #5 sck = 1;
    #5 si = address[2]; sck = 0; #5 sck = 1;
    #5 si = address[1]; sck = 0; #5 sck = 1;
    #5 si = address[0]; sck = 0; #5 sck = 1;


    #5 si = data[7]; sck = 0; #5 sck = 1;	// Send data MSB first
    #5 si = data[6]; sck = 0; #5 sck = 1;
    #5 si = data[5]; sck = 0; #5 sck = 1;
    #5 si = data[4]; sck = 0; #5 sck = 1;
    #5 si = data[3]; sck = 0; #5 sck = 1;
    #5 si = data[2]; sck = 0; #5 sck = 1;
    #5 si = data[1]; sck = 0; #5 sck = 1;
    #5 si = data[0]; sck = 0; #5 sck = 1;
    #5 sck = 0; #5 csb = 1; #5;
  end
endtask

task read(input [15:0] address, output reg [7:0] data);
  begin 
    csb = 0;				// Start Transaction
    si = 0; #5 sck = 1; 		// Send read instruction 0000 0011
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 0; sck = 0; #5 sck = 1;
    #5 si = 1; sck = 0; #5 sck = 1;
    #5 si = 1; sck = 0; #5 sck = 1;

    #5 si = address[15]; sck = 0; #5 sck = 1;	// Send address MSB first
    #5 si = address[14]; sck = 0; #5 sck = 1;
    #5 si = address[13]; sck = 0; #5 sck = 1;
    #5 si = address[12]; sck = 0; #5 sck = 1;
    #5 si = address[11]; sck = 0; #5 sck = 1;
    #5 si = address[10]; sck = 0; #5 sck = 1;
    #5 si = address[9]; sck = 0; #5 sck = 1;
    #5 si = address[8]; sck = 0; #5 sck = 1;
    #5 si = address[7]; sck = 0; #5 sck = 1;
    #5 si = address[6]; sck = 0; #5 sck = 1;
    #5 si = address[5]; sck = 0; #5 sck = 1;
    #5 si = address[4]; sck = 0; #5 sck = 1;
    #5 si = address[3]; sck = 0; #5 sck = 1;
    #5 si = address[2]; sck = 0; #5 sck = 1;
    #5 si = address[1]; sck = 0; #5 sck = 1;
    #5 si = address[0]; sck = 0; #5 sck = 1;


    #5 sck = 0; #5 data[7] = so; sck = 1;	// Receive data MSB first
    #5 sck = 0; #5 data[6] = so; sck = 1;
    #5 sck = 0; #5 data[5] = so; sck = 1;
    #5 sck = 0; #5 data[4] = so; sck = 1;
    #5 sck = 0; #5 data[3] = so; sck = 1;
    #5 sck = 0; #5 data[2] = so; sck = 1;
    #5 sck = 0; #5 data[1] = so; sck = 1;
    #5 sck = 0; #5 data[0] = so; sck = 1;
    #5 sck = 0; #5 csb = 1; #5;
 $display("performing read from %h, data is %h",address, data);
  end
endtask  

endmodule



/*
        csb = 1;

        // Write data
        #10 sck = 1;
        #10 sck = 0;
        
        write(16'h0003, 8'hAB);
        write(16'h0031, 8'h75);
      
        #10 $display("Write Enable: %b", we);
        
    
        //Reading data
        #10 sck = 0;
        #10 sck = 1;

        read(16'h0003,read_out);
        read(16'h0031, read_out1);
        #10 $display("Read Enable: %b", re);
        
    
        
      $finish; 
    end*/