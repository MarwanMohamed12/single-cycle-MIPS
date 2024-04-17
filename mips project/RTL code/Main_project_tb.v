`timescale 1ns/1ps;
module Main_project_tb();
reg clk,Reset;
wire [15:0]test_value;

MAIN_project MAIN_project(.clk(clk),.Reset(Reset),.test_value(test_value));

always begin
clk=1'b1;
#5;
clk=1'b0;
#5;
end

initial begin
Reset=1'b0;
#10;
Reset=1'b1;
#50;
end





endmodule
