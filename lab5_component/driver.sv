class driver extends component_base;
	sequencer sq;

	function new(string name, component_base parent= null);
		super.new(name, parent);
		sq=new("sq",this);
	endfunction

	function run();
		$display("pathname:%s",this.pathname());
	endfunction

endclass

