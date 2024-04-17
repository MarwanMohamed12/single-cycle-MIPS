module alu
#(parameter N=32)
(
input [N-1:0]SrcA,SrcB,
input [2:0] ALUControl,
output reg Zero,
output reg [N-1:0]ALUResult
);

reg [2*N-1 :0]multiplier;
always@*
begin
multiplier='b0;
ALUResult='b0;
case(ALUControl)
3'b000:ALUResult=SrcA&SrcB;
3'b001:ALUResult=SrcA|SrcB;
3'b010:ALUResult=SrcA+SrcB;
3'b100:ALUResult=SrcA-SrcB;
3'b101:
begin 
multiplier=SrcA*SrcB;
ALUResult=multiplier[N-1:0];
end
3'b110:
begin
if(SrcA<SrcB)
ALUResult=1;
else
ALUResult=0;
end
default: begin
ALUResult='b0;
Zero=1'b1;
end
endcase

if(ALUResult=='b0)
Zero=1'b1;
else
Zero=1'b0;
end
endmodule