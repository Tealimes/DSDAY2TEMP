module register_select #(parameter WIDTH = 32)(
    input iClk, iRstN,
    input[4:0] RS1, RS2, RD,
    input[WIDTH-1:0] RD_data,
    output[WIDTH-1:0] RS1_data, RS2_data
);
    reg[WIDTH-1:0] Reg_list [0:WIDTH-1];
  
      
   integer i;
   always@(posedge iClk)begin
        if(!iRstN)begin
            for(i = 0; i < WIDTH; i = i + 1)
                Reg_list[i] <= 32'b0;
        end
        
        Reg_list[RD] = RD_data; //writes from previous output
   end
   
   assign RS1_data = Reg_list[RS1];
   assign RS2_data = Reg_list[RS2]; 
   
endmodule