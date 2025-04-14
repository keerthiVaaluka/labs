class packet_vc extends component_base;
	agent ag;
	function new(string name, component_base parent= null);
		super.new(name, parent);
		ag=new("ag",this);
	endfunction
	task run(int runs);
		ag.dv.run(runs);
		fork
		begin
			ag.mn.run();
		end
		join_none 
	endtask
	function void configure(virtual port_if vif,int portno );
		ag.dv.vif=vif;
		ag.mn.vif=vif;
		ag.sq.portno=portno;
		ag.mn.configure(vif,portno);
	endfunction

	
endclass	
