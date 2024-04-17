`timescale 1ns/1ps;
module Register_file_tb();
reg[4:0]A1,A2,A3;
reg enaple,clk;
reg [31:0] WD3;
wire[31:0]RD1,RD2;

Register_file as(
.A1(A1),.A2(A2),.A3(A3),
.enaple(enaple),.clk(clk),
.WD3(WD3),.RD1(RD1),.RD2(RD2));

always
begin
clk=1'b1;
#5 ;
clk=1'b0;
#5 ;
end

initial begin
enaple =1'b1;
A1=5'b0;
A2=5'b0;
A3=5'b0;
WD3=32'd1;
#6
A3=5'd2;
WD3=32'd12;
#6
A1=5'd2;
A3=5'd5;
WD3=32'd15;
#6
A2=5'd5;
A3=5'd7;
WD3=32'd17;
#6
A2=5'd7;
A1=5'd7;
end

endmodule