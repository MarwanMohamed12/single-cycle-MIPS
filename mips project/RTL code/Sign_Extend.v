module Sign_extend(
input [15:0]sign_in,
output reg[31:0]sign_out
);



always@*
begin
if(sign_in[15]==1)
sign_out={~16'b0,sign_in};
else
sign_out={16'b0,sign_in};
end



endmodule 
