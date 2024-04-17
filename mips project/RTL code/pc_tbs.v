`timescale 1ns/1ps;
module pc_tbs();
localparam N=32;
reg [N-1:0]Pc_i;
reg reset,clk;
wire [N-1:0]Pc_o;

program_counter #(.N(N)) g(
	.clk(clk),
	.Pc_i(Pc_i),
	.reset(reset),
	.Pc_o(Pc_o)
			); 

localparam c=10;
always
begin
clk=1'b1;
#(c);
clk=1'b0;
#(c);
end


initial begin
Pc_i='h5a5c;
reset='b1;
#10;
Pc_i=Pc_i+4;
#10;
Pc_i=Pc_i+4;
#4;
reset='b0;
#3;
reset='b1;
end

endmodule