module reg_flags (c, cl, zl, cf, zf);
input c;
input zl, cl;

output cf;
reg cf;

output zf;
reg zf;

always @(posedge c)
begin
	cf = cl;
	zf = zl;
end

endmodule
