module adder
#(parameter n=4)
(
input [n-1:0]A,B,
output reg [n-1:0]sum
);

always@*
begin
sum=A+B;
end
endmodule
