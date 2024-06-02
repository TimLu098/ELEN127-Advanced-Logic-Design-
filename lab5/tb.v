module tb();

  reg clk, rst, farmer, fox, chicken, seeds, move;
  wire win, lose, impossible;
  wire[3:0] curr_state;
  wire [3:0] temp;

  lab5 dut(.clk(clk),
     .reset(rst),
     .farmer(farmer),
     .fox(fox),
     .chicken(chicken),
     .seed(seeds),
     .win(win),
    .lose(lose),
     .state(curr_state),
     .imp(impossible)
  );


  initial begin
  clk = 0;
  rst = 0;
  farmer = 0;
  fox = 0;
  chicken = 0;
  seeds = 0;
 
  //Reset the state machine
  #10 
  rst = 1'b1;
  #20 
  rst = 1'b0;
  $display ("farmer, fox, chicken, seeds");
  $monitor("# %t, Current state = %b, imp = %d, win = %d, lose = %d", $time, curr_state, impossible, win, lose);
  
  // Move Farmer & Chicken right
  #10 
  farmer = 1; fox = 0; chicken = 1; seeds = 0; 
  // Move Farmer left
  #10 
  farmer = 0; fox = 0; chicken = 1; seeds = 0;  
  // Move Farmer & Fox right
  #10 
  farmer = 1; fox = 1; chicken = 1; seeds = 0; 
  // Move Farmer & Chicken left
  #10 
  farmer = 0; fox = 1; chicken = 0; seeds = 0;
  // Move Farmer & Seeds right
  #10 
  farmer = 1; fox = 1; chicken = 0; seeds = 1;  
  // Move Farmer left
  #10 
  farmer = 0; fox = 1; chicken = 0; seeds = 1; 
  // Move Farmer & Chicken right
  #10 
  farmer = 1; fox = 1; chicken = 1; seeds = 1; 

  #10;

  rst = 1'b1;
  #10 rst = 1'b0;

// Impossible move 
  #10 
  farmer = 1; fox = 0; chicken = 1; seeds = 0;
  #10 
  farmer = 1; fox = 1; chicken = 1; seeds = 1;  
  #10 
  
  rst = 1'b1;
  #10 rst = 1'b0;

  //Lose case
  #10 farmer = 1; fox = 0; chicken = 0; seeds = 0;  
  #10

  farmer = 0;

  $finish;
  end

  always begin
   #5 clk = !clk;
   end
  task reset;
  output rst;
    begin
     @(posedge clk) rst = 1;
    #10 rst = 0;
    end
  endtask
endmodule
