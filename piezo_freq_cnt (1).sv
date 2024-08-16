/////////////////////////////////////////////////////////
// piezo_freq_cnt.sv:  This design implements count   //
// register that generates note frequency for piezo  //
//                                                  //
// Student 1 Name: << Charles Harrington >>       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module piezo_freq_cnt(
  input clk,				// 50MHz clock
  input rst_n,				// asynch active low reset
  input clr,				// clear freq_cnt
  input [14:0] note_per,	// period of note (15-bits)
  output piezo,piezo_n
);

  ///////////////////////////////////////
  // Declare any needed internal nets //
  /////////////////////////////////////
  
  logic [14:0] freq_cnt;
  logic [14:0] freq_cnt_nxt;

  ////////////////////////////////////////////////////
  // Implement comb logic that increments freq_cnt //
  // or clears it if clr or freq_cnt==note_per.   //
  // Use dataflow (assign statement) verilog     //
  ////////////////////////////////////////////////
  
  assign freq_cnt_nxt = (clr || (freq_cnt == note_per)) ? 15'h0 : freq_cnt + 1;
  
  ///////////////////////////////////////////////////////////////////
  // instantiate 15 d_ff as a vector to realize freq_cnt register //
  /////////////////////////////////////////////////////////////////
  
  d_ff fifteen [14:0] (.clk(clk), .D(freq_cnt_nxt), .CLRN(rst_n), .PRN(1'b1), .Q(freq_cnt));
  

  /////////////////////////////////////
  // piezo is simply freq_cnt[14] & //
  // piezo_n is inverse of that.   //
  //////////////////////////////////
  assign piezo = freq_cnt[14];
  not not1(piezo_n, piezo);

endmodule
	  