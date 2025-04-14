//`include "packet_pkg.sv"
import packet_pkg::*;
module packet_test;
	packet pack,pack1,pack2,pack3,pack4;
	initial begin
	/*	int i;
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

	*/
		$display("packet count:%0d",packet::getcount());
			pack = new("keerthi_pack", 1);
			pack.randomize();
			pack.tagmode=IDED;
			pack.print(BIN);



					pack1 = new("kkk", 2);
			pack1.randomize();
			pack1.tagmode=IDED;
			pack1.print(HEX);

			pack2 = new("kek", 4);
			pack2.randomize();
			pack2.tagmode=UNIDED;
			pack2.print(HEX);

			pack3= new("k_pack", 1);
			pack3.randomize();
			pack3.tagmode=IDED;
			pack3.print(BIN);

			pack4 = new("kei_pack", 1);
			pack4.randomize();
			pack4.tagmode=UNIDED;
			pack4.print(HEX);


		
		$display("packet count:%0d",packet::getcount());

	end
endmodule
