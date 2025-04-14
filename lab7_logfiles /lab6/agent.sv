class agent extends component_base;

  
  sequencer seq;
  driver drv;
  monitor mon;

  
  function new(string name, component_base parent = null);
    super.new(name,parent);
    
    
    seq = new("seq", this);
    drv = new("drv", this);
    mon = new("mon", this);
    
    
    drv.seq = seq;
  endfunction

endclass

