module mux
#(parameter n=4)
(
input [n-1:0]A,B,
input sel,
output reg [n-1:0]result
);

always@*
begin
if(sel)
result=B;
else
result=A;
end
endmodule
