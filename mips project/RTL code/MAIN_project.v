
module MAIN_project(
input clk,Reset,
output [15:0]test_value
);

wire jump,PCSrc,Branch,MemToreg,AlUSrc,Regdst,Regwrite,Memwrite,zero;
wire [2:0]ALUControl;
wire [1:0]ALUOp;
wire [31:0]PC,ALUOut,Writedata,Instr,ReadData;



dataBath dataBath(
.clk(clk),
.Reset(Reset),
.jump(jump),
.regwrite(Regwrite),
.regdest(Regdst),
.alusrc(AlUSrc),
.memtoreg(MemToreg),
.PCSrc(PCSrc),
.ALUcontrol(ALUControl),
.ReadData(ReadData),
.instr(Instr),
.PC(PC),
.ALU_out(ALUOut),
.writedata(Writedata),
.zero(zero)
);

ALU_decoder alu_decoder(
.Funct(Instr[5:0]),
.ALUOp(ALUOp),
.ALUcontrol(ALUControl)
);

Main_decoder m(
.Opcode(Instr[31:26]),
.jump(jump),
.memwrite(Memwrite),
.regwrite(Regwrite),
.regdest(Regdst),
.alusrc(AlUSrc),
.memtoreg(MemToreg),
.branch(Branch),
.aluop(ALUOp)
);

instruction_memory ins_memory(
.A(PC[9:2]),	
.RD(Instr) 
);
Data_memory data_memory(
.A(ALUOut),
.WD(Writedata),
.clk(clk),
.WE(Memwrite),
.RD(ReadData),
.test_value(test_value)
);
assign PCSrc=zero &Branch;

endmodule
