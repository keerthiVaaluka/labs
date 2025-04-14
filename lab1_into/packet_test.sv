//`include "packet_pkg.sv"
import packet_pkg::*;
module packet_test;
	
	packet pack;
	initial
	begin
		pack=new("keerthi_pack",1);
		pack.data=8'b00011010;
		pack.target=4'b1000;
		pack.print(HEX);
		pack.print(DECM);
		pack.print(BIN);	
	end
endmodule
