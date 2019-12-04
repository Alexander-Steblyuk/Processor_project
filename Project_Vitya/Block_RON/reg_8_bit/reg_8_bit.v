module reg_8_bit (c, d, q);
input c;
input [7:0] d;
output [7:0] q;
reg  [7:0] q;
always @ (posedge c) q = d;
endmodule
