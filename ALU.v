module ALU #(
    parameter WIDTH = 32 ) (
    input iClk,
    input iRstN, 
    input signed [WIDTH-1:0] RS1,
    input signed [WIDTH-1:0] RS2,
    input [11:0] imm_r,
    //input [7:0] pc,
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    input [4:0] shamt,
    output [WIDTH-1:0] RD
    );
    
    reg [WIDTH-1:0] RD_t;
    

    assign RD = RD_t;
endmodule
