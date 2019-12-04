module sync_wr (c, k, w_r, w_m ); 
input c; 
input [15:0] k;
output w_r, w_m; 

assign w_r = c & ( ~k[15] | ( k[15] & ~k[14] & ~k[13] )|
				( k[15] & ~k[14] & k[13] & ~ k[12] &~k[0]));
assign w_m = c & k[15] & ~k[14] & k[13] &~ k[12]& k[0];

endmodule
