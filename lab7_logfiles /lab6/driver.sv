class driver extends component_base;
  
  sequencer seq;
  virtual port_if vif;   
  packet pkt;          

  function new(string name, component_base parent = null);
    super.new(name, parent);
    seq = new("seq", this); 
  endfunction

  task run(int runs);
    $display("Driver Path: %s", pathname());
    $display("Sequencer Path from Driver: %s", seq.pathname());

    repeat (runs) begin
      seq.get_next_item(pkt);   
      pkt.print();              
      vif.drive_packet(pkt);   
     end 
  endtask

endclass

