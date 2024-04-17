module Data_memory(
input [31:0]A,WD,	//address
input clk,WE,
output reg [31:0]RD,//data
output [15:0]test_value
);

reg [31:0]ROM[0:255];

integer i;
initial begin
RD='b0;
for(i=0;i<256;i=i+1)
ROM[i]='b0;
end

always@*
begin
if(!WE)
RD=ROM[A];
else
ROM[A]=ROM[A];
end

always@(posedge clk)
begin
if(WE)
ROM[A]<=WD;
else
ROM[A]<=ROM[A];
end 
assign test_value=RD[15:0];
endmodule
