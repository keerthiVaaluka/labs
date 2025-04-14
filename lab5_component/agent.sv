class agent extends component_base;
	sequencer sq;
	driver dv;
	moniter mn;
	
	function new(string name, component_base parent= null);
		super.new(name, parent);
		sq=new("sq",this);
		dv=new("dv",this);
		mn=new("mn",this);
		dv.sq=sq;
	endfunction
	
endclass
	
