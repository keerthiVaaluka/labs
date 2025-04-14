class packet_vc extends component_base;
  
  agent agt;

  function new(string name, component_base parent = null);
    super.new(name, parent);
    agt = new("agt", this);
  endfunction

  function void configure(virtual port_if vif, int portno);
    agt.drv.vif = vif;    
    agt.mon.vif = vif;      
    agt.seq.portno = portno; 
    agt.mon.configure(vif,portno);
  endfunction

  task run(int runs);
    $display("Packet VC Path: %s", pathname());

    fork
      agt.mon.run(); 
       
    join_none
  agt.drv.run(runs); 
 
  endtask

endclass

