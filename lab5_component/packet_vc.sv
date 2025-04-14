class packet_vc extends component_base;
	agent ag;
	function new(string name, component_base parent= null);
		super.new(name, parent);
		ag=new("ag",this);
	endfunction
	function run();
		ag.dv.run();
		ag.mn.run();
	endfunction
	
endclass	
