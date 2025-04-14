//`include "packet_pkg.sv"
import packet_pkg::*;
module packet_test;
	packet pack;
	initial begin
		int i;
		pack = new("keerthi_pack", 1);
			for(i=0;i<10;i++)begin

			pack.randomize() with {target==4'b1111;};
			pack.randomize() with {ptype!=ANY;};
			//pack.data=8'b00011010;
			//pack.target=4'b1000;
			pack.print(HEX);
			pack.print(DECM);
			pack.print(BIN);
		end	
	end
endmodule
