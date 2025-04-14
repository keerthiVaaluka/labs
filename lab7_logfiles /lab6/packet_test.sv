import packet_pkg::*;

module packet_test;

  packet_vc pvc;

  initial begin

    pvc = new("pvc", null);
    pvc.run();
  end

endmodule

