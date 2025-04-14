class sequencer extends component_base;
	pbroadcast pb;
	pmulticast pm;
	psingle ps;
	int portno;
	function new(string name, component_base parent= null);
		super.new(name, parent);
	endfunction
	function void get_next_item(output packet pack);
		randcase
		1:begin
			ps=new("ps",2);
			ps.randomize();
			pack=ps;
		end
		5:begin
			pm=new("pm",2);
			pm.randomize();
			pack=pm;
		end	
		1:begin
			pb=new("pb",2);
			pb.randomize();
			pack=pb;
		end	
		
		endcase

	endfunction
endclass

