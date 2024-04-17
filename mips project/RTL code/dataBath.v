module dataBath(
input clk,Reset,
input jump,regwrite,
      regdest,alusrc,memtoreg,
input PCSrc,
input [2:0]ALUcontrol,
input [31:0]ReadData,instr,
output [31:0]PC,ALU_out,writedata,
output zero
);

wire [31:0] PCBranch,PCPlus4,result_m1,concate_wire,PC_dash,PC_s;
wire [31:0]Result,SrcA,wire_to_m4,SrcB,sign_lmm,sign_lmm_shifted,ALUResult;
wire [27:0]wire_m2_before;

wire [4:0]WriteReg;
mux #(.n(32)) Mux1(.A(PCPlus4),.B(PCBranch),.sel(PCSrc),.result(result_m1));

mux #(.n(32)) Mux2(.A(result_m1),.B(concate_wire),.sel(jump),.result(PC_dash));

program_counter #(.N(32)) pc(.Pc_i(PC_dash),.clk(clk),.reset(Reset),.Pc_o(PC_s));

adder #(.n(32)) adder1(.A(PC_s),.B(32'd4),.sum(PCPlus4));

Register_file Reg(
.A1(instr[25:21]),
.A2(instr[20:16]),
.A3(WriteReg),
.enaple(regwrite),
.clk(clk),
.WD3(Result),
.RD1(SrcA),
.RD2(wire_to_m4) );

mux #(.n(5)) Mux3(.A(instr[20:16]),.B(instr[15:11]),.sel(regdest),.result(WriteReg));

mux #(.n(32)) Mux4(.A(wire_to_m4),.B(sign_lmm),.sel(alusrc),.result(SrcB));

Sign_extend si(.sign_in(instr[15:0]),.sign_out(sign_lmm));

shift_left_twice #(.n(32),.s(32)) shift1(.shift_in(sign_lmm),.shift_out(sign_lmm_shifted));

shift_left_twice #(.n(26),.s(28)) shift2(.shift_in(instr[25:0]),.shift_out(wire_m2_before));

adder #(.n(32)) adder2(.A(sign_lmm_shifted),.B(PCPlus4),.sum(PCBranch));

alu #(.N(32)) alu1(.SrcA(SrcA),.SrcB(SrcB),.ALUControl(ALUcontrol),.Zero(zero),
.ALUResult(ALUResult));

mux #(.n(32)) Mux5(.A(ALUResult),.B(ReadData),.sel(memtoreg),.result(Result));

assign concate_wire={PCPlus4[31:28],wire_m2_before};
assign PC=PC_s;
assign ALU_out=ALUResult;
assign writedata=wire_to_m4;
endmodule
