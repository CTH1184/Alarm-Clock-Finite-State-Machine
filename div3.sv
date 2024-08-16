//////////////////////////////////////////////////////////
// div3.sv:  This design implements a 4-bit counter    //
// to assert inc_nxt signal every 3 clks if enabled	  //
//                                                   //
// Student 1 Name: << Enter you name here >>        //
// Student 2 Name: << Enter name if applicable >>  //
////////////////////////////////////////////////////
module div3(
  input clk,			// 50MHz
  input rst_n,			// asynch active low reset
  input en,				// only increment when enabled
  output [3:0] cnt,		// BCD digit for this divider
  output inc_nxt		// if count full and enable then increment
						// next counter up the food chain
);

  ///////////////////////////////////////////
  // Declare any needed internal signals. //
  /////////////////////////////////////////
	logic [3:0]D;
	logic three;
  
  ////////////////////////////////////////////////////////////////////
  // Instantiate clkdivComb and feedback nxt_divcnt to flop inputs //
  //////////////////////////////////////////////////////////////////
	div3Comb CLK1(.cnt(cnt), .nxt_cnt(D), .three(three));
  
  /////////////////////////////////////////////////////////////
  // Instantiate 4 d_en_ff as a vector to implement counter //
  // Should be reset with rst_n.  Tie PRN inactive.  Only  //
  // enabled when enable signal high.                     //
  /////////////////////////////////////////////////////////
   d_en_ff F1[3:0] (.clk(clk), .D(D), .CLRN(rst_n), .EN(en), .Q(cnt));
  
				  
  //////////////////////////////////////////////////////
  // When this counter full and enabled we increment //
  // the next counter up the food chain.            //
  ///////////////////////////////////////////////////
   and AND1(inc_nxt, three , en);
  
endmodule
  