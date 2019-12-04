module d_mux (ax, c, ca, cb, cc, cd, ce, cf, cg, ch);
input [2:0]  ax; 
input  c;
output ca, cb, cc, cd, ce, cf, cg, ch;

assign ca = c & (ax == 3'b000);
assign cb = c & (ax == 3'b001);
assign cc = c & (ax == 3'b010);
assign cd = c & (ax == 3'b011) ;
assign ce = c & (ax == 3'b100);
assign cf = c & (ax == 3'b101);
assign cg = c & (ax == 3'b110);
assign ch = c & (ax == 3'b111);

endmodule 
