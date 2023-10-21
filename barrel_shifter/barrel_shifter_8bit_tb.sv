//`timescale 1ns / 10ps

module testbench;
    logic [7:0] data;
    logic [2:0] amt;
    logic [7:0] out;

    barrel_shifter_8bit dut(.*);
  initial begin
    $monitor("Time %0d amt=%d data=%b out=%b", $time, amt, data, out);
  end

  task Expected_result;
    input [7:0] exp_out;
    if (out == exp_out) 
     begin 
      $display("TEST PASSED B/C Expected_result Was ==> %d", out);
     $display("############################################## ");
     end
   else
     $display("TEST FAILED B/C Expected_result Was ==> %d",out);

  endtask

  initial begin
    amt=3'd0; data=8'b00000011; #10 Expected_result (8'b00000011);
    amt=3'd1; data=8'b00000011; #10 Expected_result (8'b10000001);
    amt=3'd2; data=8'b00000011; #10 Expected_result (8'b11000000);
    amt=3'd3; data=8'b00000011; #10 Expected_result (8'b01100000);
    amt=3'd4; data=8'b00000011; #10 Expected_result (8'b00110000);
    amt=3'd5; data=8'b00000011; #10 Expected_result (8'b00011000);
    amt=3'd6; data=8'b00000011; #10 Expected_result (8'b00001100);
    amt=3'd7; data=8'b00000011; #10 Expected_result (8'b00000110);

    $finish;
  end
      
endmodule
