class component_base;
  protected string name;
  component_base parent;

  
  function new(string inst_name, component_base parent_inst = null);
    this.name = inst_name;
    this.parent = parent_inst;
  endfunction

  
  function string getname();
    return name;
  endfunction

  
  function string pathname();
    if (parent == null) 
      return name;
    else
      return {parent.pathname(), ".", name};
  endfunction

  
  function void print();
    $display("Component Name: %s, Path: %s", name, pathname());
  endfunction

endclass

