`timescale 1ns/1ps;
module Data_memory_tb();
reg [31:0]A,WD;	
reg clk,WE;
wire [31:0]RD;
wire [15:0]test_value;

Data_memory w(.A(A),.WD(WD),.WE(WE),.clk(clk),.RD(RD),.test_value(test_value));
 integer i;
always
begin
clk=1'b1;
#5;
clk=1'b0;
#5;
end

initial begin
WE=1'b1;
A=32'b0;
WD=32'd0;
for(i=0;i<16;i=i+1)
begin
#10;
A=A+1;
WD=WD+1;
end
#1;
WE=1'b0;
A=32'b0;
for(i=0;i<16;i=i+1)
begin
#10;
A=A+1;
end

end


endmodule