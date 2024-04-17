module program_counter
#(parameter N=32)
(
input [N-1:0]Pc_i,
input reset,clk,
output [N-1:0]Pc_o
);

reg [N-1:0] Q_reg,Q_next;
always@(posedge clk,negedge reset)
begin
Q_reg<=Q_reg;
if(!reset)
Q_reg<='b0;
else
Q_reg<=Q_next;

end

always@*
begin
Q_next=Pc_i;
end
assign Pc_o=Q_reg;
endmodule
