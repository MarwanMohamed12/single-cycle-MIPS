module Main_decoder(
input [5:0]Opcode,
output reg jump ,memwrite,regwrite,
	regdest,alusrc,memtoreg,
	branch,
output reg [1:0]aluop
);

always@*
begin
case(Opcode)
6'b100011:
begin
jump=1'b0;
aluop=2'b00;
memwrite=1'b0;
regwrite=1'b1;
regdest=1'b0;
alusrc=1'b1;
memtoreg=1'b1;
branch=1'b0;
end
6'b101011:
begin
jump=1'b0;
aluop=2'b00;
memwrite=1'b1;
regwrite=1'b0;
regdest=1'b0;
alusrc=1'b1;
memtoreg=1'b1;
branch=1'b0;
end
6'b000000:
begin
jump=1'b0;
aluop=2'b10;
memwrite=1'b0;
regwrite=1'b1;
regdest=1'b1;
alusrc=1'b0;
memtoreg=1'b0;
branch=1'b0;
end
6'b001000:
begin
jump=1'b0;
aluop=2'b00;
memwrite=1'b0;
regwrite=1'b1;
regdest=1'b0;
alusrc=1'b1;
memtoreg=1'b0;
branch=1'b0;
end
6'b000100:
begin
jump=1'b0;
aluop=2'b01;
memwrite=1'b0;
regwrite=1'b0;
regdest=1'b0;
alusrc=1'b0;
memtoreg=1'b0;
branch=1'b1;
end
6'b000010:
begin
jump=1'b1;
aluop=2'b00;
memwrite=1'b0;
regwrite=1'b0;
regdest=1'b0;
alusrc=1'b0;
memtoreg=1'b0;
branch=1'b0;
end
default:
begin
jump=1'b0;
aluop=2'b00;
memwrite=1'b0;
regwrite=1'b0;
regdest=1'b0;
alusrc=1'b0;
memtoreg=1'b0;
branch=1'b0;
end

endcase
end

endmodule