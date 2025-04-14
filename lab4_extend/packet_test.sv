//`include "packet_pkg.sv"
import packet_pkg::*;
module packet_test;
	packet pack[16];
	pbroadcast pb;
	pmulticast pm;
	psingle ps;
	initial begin
		int i;
		//pack = new("keerthi_pack", 1);
			foreach(pack[i])begin
				randcase
					1:begin
						ps=new("ps",2);
						ps.randomize();
						pack[i]=ps;
					end
					2:begin
						pm=new("pm",2);
						pm.randomize();
						pack[i]=pm;
					end	
					3:begin
						pb=new("pb",2);
						pb.randomize();
						pack[i]=pb;
					end	
					
				endcase	

		/*	pack.randomize() with {target==4'b1111;};
			pack.randomize() with {ptype!=ANY;};
			//pack.data=8'b00011010;
			//pack.target=4'b1000;
			pack.print(HEX);
			pack.print(DECM);
			pack.print(BIN);*/
		end	

		foreach(pack[i])begin
			pack[i].print();
			pack[i].validate();
		end	

	end
endmodule
