`timescale 1ns / 1ps


module top #(parameter WIDTH = 32)
    (
    input iClk,
    input iRstN,
    output[WIDTH-1:0] rd
    );
    
    
    // Wires for passing along data processed from engines
    wire[WIDTH-1:0] RS1_data, RS2_data, RD_data;
    
    // FW wires
    wire[4:0] RD, RS2, RS1;
    wire[6:0] Funct7;
    wire[2:0] Funct3;
    wire[6:0] opcode;
    
    
    // Stores instructions in memory & fetches them from processing

    
    // Register select module 

                                      
    // ALU engine to perform math calculations

                 

    // Would have more modules in a full design
    
    assign rd = RD_data;
endmodule
