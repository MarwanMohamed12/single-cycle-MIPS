module shift_left_twice
#(parameter n=6,s=6)
(
input [n-1:0]shift_in,
output reg[s-1:0]shift_out
);

always@*
begin
shift_out=shift_in<<2;
end

endmodule
