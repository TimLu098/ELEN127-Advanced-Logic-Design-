assign enableSignal = (enable) ? (select == 3'b000) ? 8'b00000001 :
                                     (select == 3'b001) ? 8'b00000010 :
                                     (select == 3'b010) ? 8'b00000100 :
                                     (select == 3'b011) ? 8'b00001000 :
                                     (select == 3'b100) ? 8'b00010000 :
                                     (select == 3'b101) ? 8'b00100000 :
                                     (select == 3'b110) ? 8'b01000000 :
                                     (select == 3'b111) ? 8'b10000000 :
                                     8'b00000000 : 8'b00000000;