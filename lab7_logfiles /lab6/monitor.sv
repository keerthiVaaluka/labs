class monitor extends component_base;
    virtual port_if vif;
    packet pkt;
    int log_file;

    function new(string name, component_base parent = null);
        super.new(name, parent);
    endfunction

    function void configure(virtual port_if vif, int portno);
        this.vif = vif;
        // Open a log file for each monitor
        log_file = $fopen($sformatf("port%d.txt",portno), "w");
        $display("hi");
        if (!log_file) 
            $fatal(1, "Error: Failed to open log file for port %d", portno);
        $display("Monitor for port %0d initialized. Logging to port%d.log", portno, portno);
    endfunction

    task run();
        $display("Monitor started for port.");
        forever begin
            vif.collect_packet(pkt);
            //pkt.print();
            $display("bye");
            $display( "[%0t ns] Name: %s, Target: %b, Source: %b, Data: %h, PType: %s\n",
                    $time, pkt.getname(), pkt.target, pkt.source, pkt.data, pkt.p);
            // Write packet details to log file
            $fdisplay(log_file, "[%0t ns] Name: %s, Target: %b, Source: %b, Data: %h, PType: %s\n",
                    $time, pkt.getname(), pkt.target, pkt.source, pkt.data, pkt.p);
                    
        end
           $fclose(log_file);
    endtask

  /*  function void close();
        $fclose(log_file);
    endfunction*/
endclass

