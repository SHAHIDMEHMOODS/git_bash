// Code your testbench here
// or browse Examples
//`timescale 1ns / 10ps

module testbench;
    logic [31:0] data;
    logic [4:0] amt;
    logic [31:0] out;

    barrel_shifter_32bit dut(.*);
  initial begin
    $monitor("Time %0d amt=%d data=%0d out=%0d", $time, amt, data, out);
  end

  task Expected_result;
    input [31:0] exp_out;
    if (out == exp_out) 
     begin 
      $display("TEST PASSED B/C Expected_result Was ==> %d", out);
     $display("############################################## ");
     end
   else
     $display("TEST FAILED B/C Expected_result Was ==> %d",out);

  endtask

  initial begin
    amt=5'd0;  data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00000000000000000000000000000011);
    amt=5'd1;  data=32'b00000000000000000000000000000011; #10 Expected_result (32'b10000000000000000000000000000001);
    amt=5'd2;  data=32'b00000000000000000000000000000011; #10 Expected_result (32'b11000000000000000000000000000000);
    amt=5'd3;  data=32'b00000000000000000000000000000011; #10 Expected_result (332'b01100000000000000000000000000000);
    amt=5'd4;  data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00110000000000000000000000000000);
    amt=5'd5;  data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00011000000000000000000000000000);
    amt=5'd6; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00001100000000000000000000000000);
    amt=5'd7; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00000110000000000000000000000000);
    amt=5'd15; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00000000000001100000000000000000);
    amt=5'd25; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00000000000000000000000110000000);
    amt=5'd25; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00000000000000000000000110000000);
    amt=5'd30; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b00000000000000000000000000001100);
    amt=5'd31; data=32'b00000000000000000000000000000011; #10 Expected_result (32'b0000000000000000000000000000110);

    $finish;
  end
      
endmodule
