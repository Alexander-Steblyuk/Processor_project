module control (c, k, cf, zf, jmp, ak);
input c, cf, zf;
input [15:0] k;
output [7:0] ak;
reg [7:0] ak;
output jmp;
assign jmp = (k[15] & k[13] & k[12])&
			((~k[10] & ~k[9] & ~k[8])|
			(~k[10] & ~k[9] & k[8] & zf)|
			(~k[10] & k[9] & ~k[8] & cf));
always @(negedge c)
if(jmp) ak = k[7:0];
else ak = ak + 1;
endmodule
