`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 08:42:39
// Design Name: 
// Module Name: fpu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//`timescale 1ns / 1ps

//TEST BENCH
module fpu_tb;
    reg [63:0] A;
    reg [63:0] B;
    reg [1:0] OPR;
    wire [63:0] RSLT;
    real REAL_RSLT;

    fpu dut(.a(A), .b(B), .op(OPR), .result(RSLT));

    initial begin
        $dumpfile("fpu.vcd");
        $dumpvars(0, fpu_tb);

        
        // Pair 1: 2.5 + 4.75 = 7.25
        
        A = 64'h4004000000000000; // 2.5
        B = 64'h4013C00000000000; // 4.75
        OPR = 2'b00;
        #10 REAL_RSLT = $bitstoreal(RSLT);
        $display("ADD:      %f + %f = %f", $bitstoreal(A), $bitstoreal(B), REAL_RSLT); // Expected: 7.25
        
        // Pair 2: 8.5/ 1.7 = 5.0
        
        A = 64'h4021000000000000; // 8.5
        B = 64'h3FFB333333333333; // 1.7
        OPR = 2'b11;
        #10 REAL_RSLT = $bitstoreal(RSLT);
        $display("DIV:      %f / %f = %f", $bitstoreal(A), $bitstoreal(B), REAL_RSLT); // Expected: 3.0
        
         // Pair 3: 1.8 * 0.5 = 0.9
  
        A = 64'h3FFCCCCCCCCCCCCD; // 1.8
        B = 64'h3FE0000000000000; // 0.5
        OPR = 2'b10;
        #1
        #10 REAL_RSLT = $bitstoreal(RSLT);
        $display("MUL:      %f * %f = %f", $bitstoreal(A), $bitstoreal(B), REAL_RSLT); // Expected: 3.75


        
        // Pair 4: 9.0 - 3.25 = 5.75
     
        A = 64'h4022000000000000; // 9.0
        B = 64'h400A000000000000; // 3.25
        OPR = 2'b01;
        #1
        #10 REAL_RSLT = $bitstoreal(RSLT);
        $display("SUB:      %f - %f = %f", $bitstoreal(A), $bitstoreal(B), REAL_RSLT); // Expected: 5.75
        

        #10 $finish;
    end
endmodule