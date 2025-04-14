class component_base;
	protected string name;

	component_base parent;
	function new(string name,component_base b1=null);
		this.name=name;
		this.parent=b1;
	endfunction
	function string pathname();
    		if (parent == null)
      			return name;
    		else
      			return {parent.pathname(), ".", name};
  	endfunction

	function print();
		$display("name:%s |parent",pathname());
	endfunction
	function string getname();
		return name;
	endfunction
endclass	
