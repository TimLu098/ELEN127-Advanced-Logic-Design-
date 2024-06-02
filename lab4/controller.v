module Controller(
  input clk,       
  input reset,       // Reset signal
  input [1:0] stick, // 2-bit bus for stick position  
  output reg L_outer,   // Left outer light control
  output reg L_middle,  // Left middle light control
  output reg L_inner,   // Left inner light control
  output reg R_inner,   // Right inner light control
  output reg R_middle,  // Right middle light control
  output reg R_outer    // Right outer light control
);
reg [2:0] cs, ns;


always @(posedge clk) begin
	if (reset) cs <= 0;
	else cs<= ns;
end

always @(*) begin
  case (cs)
	0:	if (stick == 0) begin
			L_outer = 0;
			L_middle = 0;
			L_inner = 0;
			R_outer = 0;
			R_middle = 0;
			R_inner = 0;
			ns = 0;
		end
		else if (stick == 1) begin
			L_outer = 0;
			L_middle = 0;
			L_inner = 0;
			R_outer = 0;
			R_middle = 0;
			R_inner = 0;
			ns = 1;
		end
		else if (stick == 2) begin
			L_outer = 0;
			L_middle = 0;
			L_inner = 0;
			R_outer = 0;
			R_middle = 0;
			R_inner = 0;
			ns = 4;
		end
	1:	if (stick == 1) begin
			R_inner = 1;
			L_outer = 0;
			L_middle = 0;
			L_inner = 0;
			R_middle = 0;
			R_outer = 0;
			ns = 2;
		end
		else if (stick == 0) begin
			ns = 0;
		end
		else if (stick == 2) begin
			ns = 4;
		end
	2:	if (stick == 1) begin
			R_middle = 1;
			L_outer = 0;
			L_middle = 0;
			L_inner = 0;
			R_outer = 0;
			R_inner = 1;
			ns = 3;
		end
		else if (stick == 0) begin
			ns = 0;
		end
		else if (stick == 2) begin
			ns = 4;
		end
	3:	if (stick == 1) begin
			L_outer = 0;
			L_middle = 0;
			L_inner = 0;
			R_outer = 1;
			R_middle = 1;
			R_inner = 1;
			ns = 0;
		end
		else if (stick == 0) begin
			ns = 0;
		end
		else if (stick == 2) begin
			ns = 4;
		end
	4:	if (stick == 2) begin
			L_inner = 1;
			L_outer = 0;
			L_middle = 0;
			R_outer = 0;
			R_middle = 0;
			R_inner = 0;
			ns = 5;
		end
		else if (stick == 0) begin
			ns = 0;
		end
		else if (stick == 1) begin
			ns = 1;
		end
	5:	if (stick == 2) begin
			L_inner = 1;
			L_middle = 1;
			L_outer = 0;
			R_outer = 0;
			R_middle = 0;
			R_inner = 0;
			ns = 6;
		end
		else if (stick == 0) begin
			ns = 0;
		end
		else if (stick == 1) begin
			ns = 1;
		end
	6:	if (stick == 2) begin
			L_outer = 1;
			L_middle = 1;
			L_inner = 1;
			R_outer = 0;
			R_middle = 0;
			R_inner = 0;
			ns = 0;
		end
		else if (stick == 0) begin
			ns = 0;
		end
		else if (stick == 1) begin
			ns = 1;
		end
  endcase
end


endmodule