module alu (x, y, k, cf,dm, q,  cl, zl); 
input [7:0 ] x; 
input [7:0] y; 
input cf; 
input [15:0] k;  
input [7:0] dm; 

output [7:0] q;  
reg [7:0] q;     

output cl;  
reg cl; 

output zl; 

always
    if ( k [15] == 0) 
		case (k [14:12]) 
			0: {cl,q}= {1'b0, k [7:0]}; 
			1: {cl,q} = x + k [7:0];
			2: {cl,q} = x + k [7:0] + cf;   
			3: {cl,q} = {1'b0,( x & k [7:0])}; 
			4: {cl,q} = {1'b0,( x | k [7:0])};
			5: {cl,q} = {1'b0,( x ^ k [7:0])}; 
		endcase 
	else
		if (k[15:12] == 8) 
			case (k [2:0])
				0: {cl,q} = {1'b0, y};
				1: {cl,q} = x + y; 
				2: {cl,q} = x + y+cf;
				3: {cl,q} = {1'b0,( x & y)};  
				4: {cl,q} = {1'b0,( x | y)}; 
				5: {cl,q} = {1'b0,( x ^ y)}; 
			endcase   
		else 
			if (k[15:12] == 9)  
				case (k [2:0])
					0: {q,cl} = {cf,x};  
					1: {cl,q} = {x,cf};
					2: {q} = {x[7], x};
				endcase 
			else 
				if (k[15:12] == 4'b1010)
					case (k [0])
						0: q = dm; 
						1: q = x;
					endcase 
				else  q=0;
				
assign zl = (q==0); 

endmodule
