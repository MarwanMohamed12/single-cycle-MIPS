module Register_file(
input[4:0]A1,A2,A3,
input enaple,clk,
input [31:0] WD3,
output reg[31:0]RD1,RD2
);

reg [31:0]ROM[0:31];
integer i;
initial begin 
for(i=0;i<32;i=i+1)
begin
ROM[i]=32'b0;
end
end

always@*
begin
RD1=ROM[A1];
RD2=ROM[A2];
end

always@(posedge clk)
begin
if(enaple==1'b1)
ROM[A3]<=WD3;
else
ROM[A3]<=ROM[A3];
end



endmodule
