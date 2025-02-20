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
    
    
    always@(posedge iClk or negedge iRstN) begin
        if(!iRstN) begin
            RD_t <= 0;
            
        //Register Type
        end else if(opcode == 7'b0110011) begin 
            case(funct3)
                3'b000 : RD_t <= (funct7 == 7'b0100000) ? RS1 - RS2 : RS1 + RS2;
                3'b010 : RD_t <= (RS1 < RS2) ? 1'b1 : 1'b0; //signed
                3'b011 : RD_t <= (RS1 < RS2) ? 1'b1 : 1'b0; //unsigned 
                3'b100 : RD_t <= RS1 ^ RS2;
                3'b110 : RD_t <= RS1 | RS2;
                3'b111 : RD_t <= RS1 & RS2;
                3'b001 : RD_t <= RS1 << RS2;
                3'b101 : RD_t <= (funct7 == 7'b0100000) ? RS1 >>> RS2 : RS1 >> RS2;  
                default : RD_t <= RD_t;
            endcase
     
        //Immediate Type
        end else if(opcode == 7'b0010011) begin
            case(funct3)
                3'b000 : RD_t <= (funct7 == 7'b0100000) ? RS1 - imm_r : RS1 + imm_r;
                3'b010 : RD_t <= (RS1 < imm_r) ? 1'b1 : 1'b0; //signed
                3'b011 : RD_t <= (RS1 < imm_r) ? 1'b1 : 1'b0; //unsigned
                3'b100 : RD_t <= RS1 ^ imm_r;
                3'b110 : RD_t <= RS1 | imm_r;
                3'b111 : RD_t <= RS1 & imm_r;
                3'b001 : RD_t <= RS1 << shamt;
                3'b101 : RD_t <= (funct7 == 7'b0100000) ? RS1 >>> shamt : RS1 >> shamt; 
                default RD_t <= RD_t; 
            endcase
        end else begin
            RD_t <= 0;
        end
        
    end
    assign RD = RD_t;
endmodule