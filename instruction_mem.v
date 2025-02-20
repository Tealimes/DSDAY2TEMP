module instruction_mem #(parameter WIDTH = 32)
    (
    input iClk,
    input iRstN,
    output [4:0] RD, RS2, RS1,
    output [6:0] Funct7,
    output [2:0] Funct3,
    output [6:0] opcode
    );

    reg[WIDTH-1:0] pc;
    reg[WIDTH-1:0] addr;
    
    // FW registers
    reg[4:0] rd, rs2, rs1;
    reg[6:0] funct7;
    reg[2:0] funct3;
    reg[6:0] Opcode;
    
    localparam NUM_INST = 15;
    
    // Last instruction must be a NO-OP 
reg [WIDTH-1:0] inst_rom [0:NUM_INST-1];
    
    initial begin
        inst_rom[0]  = 32'h00A08093; // ADDI
        inst_rom[1]  = 32'h00A10113; // ADDI
        inst_rom[2]  = 32'h001101B3; // ADD
        inst_rom[3]  = 32'h0030A233; // SLT
        inst_rom[4]  = 32'h00115293; // SRLI
        inst_rom[5]  = 32'h00211313; // SLLI
        inst_rom[6]  = 32'h0032F3B3; // AND
        inst_rom[7]  = 32'h0032E433; // OR
        inst_rom[8]  = 32'h0032C4B3; // XOR
        inst_rom[9]  = 32'h40610533; // SUB
        inst_rom[10] = 32'h004155B3; // SRL
        inst_rom[11] = 32'h00411633; // SLL
        inst_rom[12] = 32'h40555693; // SRAI
        inst_rom[13] = 32'h40555733; // SRA
        inst_rom[14] = 32'h00000000; // NO-OP
    end

    always@(posedge iClk)begin
        if(!iRstN) begin
            addr <= 32'b0;
            pc   <= 32'b0;
        end

        else begin
            if(pc < NUM_INST) begin
                addr <= inst_rom[pc];
                pc   <= pc + 1;
            end
        end
    end

    // Extract machine code to run proper FW assembly
    always@(posedge iClk)begin 
        if(!iRstN) begin
            rd <= 5'b0;
            rs2 <= 5'b0;
            rs1 <= 5'b0;
            funct7 <= 7'b0;
            funct3 <= 3'b0;
            Opcode <= 7'b0;
        end
            
        else begin
                Opcode <= {addr[6:0]};
                rd     <= {addr[11:7]};
                funct3 <= {addr[14:12]};
                rs1    <= {addr[19:15]};
                rs2    <= {addr[24:20]};
                funct7 <= {addr[31:25]};
        end
    end
    
    assign RD = rd;
    assign RS1 = rs1;
    assign RS2 = rs2;
    assign Funct3 = funct3;
    assign Funct7 = funct7;
    assign opcode = Opcode;
    
endmodule