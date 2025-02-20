`timescale 1ns / 1ps


module tb();
    parameter WIDTH = 32;
    reg iClk, iRstN; // inputs
    wire [WIDTH-1:0] rd; // output
    
    // module instantiation
    top CPU (.iClk(iClk),.iRstN(iRstN),.rd(rd));
    
    always #5 iClk = ~iClk;
    
    initial begin
        $dumpfile("tb.vcd"); $dumpvars;
        
        iClk = 0;
        iRstN = 0;
        
        #10; 
        
        iRstN = 1;
        
        #1000;
        
        $finish;
    
    end
endmodule
