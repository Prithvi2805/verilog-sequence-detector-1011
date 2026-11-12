//1011
module tb_mealy_overlapping;
  reg clk;
  reg rst;
  reg din;
  wire dout;
  
  mealy_overlapping m1(.clk(clk), .rst(rst), .din(din), .dout(dout));
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    din = 0;
    
    #10
    rst = 0;
// sequnce101101110010110110001011
    
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;
    #10 din = 0;
    #10 din = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    
    #20 $finish;
  end
  
  initial begin
    $monitor("time = %0t | din = %0b | dout = %0d", $time, din, dout);
  end
endmodule
    
