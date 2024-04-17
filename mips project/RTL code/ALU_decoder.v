module ALU_decoder(
input [5:0]Funct,
input [1:0]ALUOp,
output reg [2:0]ALUcontrol
);


always@*
begin

casex({ALUOp,Funct})
8'b00xxxxxx:
begin
ALUcontrol=3'b010;
end
8'b01xxxxxx:
begin
ALUcontrol=3'b100;
end
8'b10100000:
begin
ALUcontrol=3'b010;
end
8'bxx100010 :
begin
ALUcontrol=3'b100;
end
8'bxx101010 :
begin
ALUcontrol=3'b110;
end
8'bxx011100 :
begin
ALUcontrol=3'b101;
end
default     :
begin
ALUcontrol=3'b010;
end

endcase



end

endmodule
