class sequencer extends component_base;
    int portno;
    psingle ps;
    pmulticast pm;
    pbroadcast pb;
    packet pkt;
    function new(string name, component_base parent = null);
        super.new(name, parent);
    endfunction

    function void get_next_item(output packet pkt);
        randcase
            5: begin
                ps = new("p_single", portno);
                ps.randomize();
                pkt = ps;
            end
            2: begin
                pm = new("p_multi", portno);
                pm.randomize();
                pkt = pm;
            end
            3: begin
                pb = new("p_broad", portno);
                pb.randomize();
                pkt = pb;
            end
        endcase
    endfunction
endclass

