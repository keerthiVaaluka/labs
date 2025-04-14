module packet_test;

  // Check import matches your package name
  import packet_pkg::*;

  logic clk = 1'b0;
  logic reset = 1'b0;

  // 4-Port Switch interface instance
  port_if port0 (clk, reset);

  // Declare a handle for packet_vc
  packet_vc pvc;

  // Clock generator
  always
    #10 clk <= ~clk;

  initial begin
    // Hold suspend low to allow data to be output
    port0.suspend_ip = 0;
    $timeformat(-9,2," ns",8);
    reset = 1'b0;
    @(negedge clk);
    reset = 1'b1;
    @(negedge clk);
    reset = 1'b0;

    pvc = new("pvc", null);      
    pvc.configure(port0, 3);      
    pvc.run(10);                  

    $finish;
  end

//--------------------validate functions for verification --------------------

function int countones (input logic[3:0] vec);
  countones = 0;
  foreach (vec[i])
    if (vec[i]) countones++;
endfunction

function void validate (input packet ap);
  int sco, tco;
  sco = countones(ap.source);
  tco = countones(ap.target);
  if (sco != 1) 
     $display("ERROR in source %h - no. bits set = %0d", ap.source, sco);
  if (ap.p == BROADCAST) begin
    if  (ap.target != 4'hf) 
       $display("ERROR: broadcast packet target is %h not 4'hf", ap.target);
  end
  else 
  begin
    if ( |(ap.source & ap.target) == 1'b1)   
      $display("ERROR: non-broadcast packet %s has same source %h and target %h bit set", ap.getname(), ap.source, ap.target);
    if ((ap.p == SINGLE) & (tco != 1)) 
      $display("ERROR: single packet %s does not have only one bit set in target %h", ap.getname(), ap.target);
    if ((ap.p == MULTICAST) & (tco < 2)) 
      $display("ERROR: multicast packet %s does not have more than one bit set in target %h", ap.getname(), ap.target);
  end
endfunction
     
endmodule

