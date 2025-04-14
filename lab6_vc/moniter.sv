class moniter extends component_base;
	virtual port_if vif;
	packet pkt;
	function new(string name, component_base parent= null);
		super.new(name, parent);
	endfunction

	task run();
		$display("pathname:%s",this.pathname());
		forever begin	
			vif.collect_packet(pkt);
			pkt.print();
		end
	endtask
endclass
