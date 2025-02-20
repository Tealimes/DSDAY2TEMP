module register_select #(parameter WIDTH = 32)(
    input iClk, iRstN,
    input[4:0] RS1, RS2, RD,
    input[WIDTH-1:0] RD_data,
    output[WIDTH-1:0] RS1_data, RS2_data
);
    reg[WIDTH-1:0] Reg_list [0:WIDTH-1];
  
      
   
endmodule
