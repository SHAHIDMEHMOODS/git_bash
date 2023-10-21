module test ( ); 
  parameter DW = 32; 
  parameter AW = 9; 
  parameter RS = 512;
  logic rst ; 
  logic clk ; 
  logic pop; 
  logic push; 
  logic [DW-1:0] dout;
  logic [DW-1:0] din;
  logic empty, full;
  logic dump;
  logic [DW-1:0]r_out;

  logic [DW-1:0] refq [$];
  logic [DW-1:0] rd_data, wr_data; 
   fifo dut (.clk(clk),.rst(rst),.dump(dump), 
  .din(din),.dout(dout),.push(push), 
  .pop(pop),.empty(empty),.full(full));

initial begin 
  clk = 1'b0; push=0; pop=0; dump=0; din=32'd0;
  wr_data = $urandom();
  reset_fifo(); 
repeat ($urandom()%16) @(posedge clk); 
  wr_data = 32'h10; 
  wr(wr_data++); 
  @(posedge clk);
  wr(wr_data++); 
repeat ($urandom()%16) @(posedge clk); 
  rd(rd_data); 
  @(posedge clk);
  rd(rd_data); 
  @(posedge clk);
  repeat (1000) @(posedge clk); 
  $finish; 
  end 

 always #5 clk = ~clk;
  
initial begin 
    $monitor(" rst=%b push=%b pop=%b din=%d dout=%d",rst,push,pop, din,dout);

  clk = 0; 
  //push= 0;
 // pop=  0;
  //din=  0; 
  end
task reset_fifo (); 
  rst = 1'b0; 
  repeat (2) @(posedge clk); 
  rst = 1'b1; 
  @(posedge clk); 
  rst = 1'b0; 
endtask 
task wr (logic [31:0] wd); 
  push = 1'b1; 
  pop = 1'b0; 
  din = wd; 
  @(posedge clk); 
  #1;
  push = 1'b0; 
  din = 32'h0;
  refq.push_back(wd);
endtask 
task rd(output logic [31:0] rd); 
  pop = 1'b1; 
  push = 1'b0; 
  @(posedge clk); 
  rd = dout; 
  pop = 1'b0; 
  r_out=refq.pop_front();
endtask 
endmodule
