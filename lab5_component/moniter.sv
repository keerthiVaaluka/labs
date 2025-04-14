class moniter extends component_base;
	function new(string name, component_base parent= null);
		super.new(name, parent);
	endfunction

	function run();
		$display("pathname:%s",this.pathname());
	endfunction
endclass
