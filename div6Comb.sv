/////////////////////////////////////////////////////////
// div6Comb.sv:  This design implements a 4-bit       //
// incrementor and logic to divide by 6 	         //
//                                                  //
// Student 1 Name: << Enter you name here >>       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module div6Comb(cnt, nxt_cnt, six);

  input [3:0] cnt;			// div6 requires a 3-bit counter but we use 4-bit
  output [3:0] nxt_cnt;  	// incremented version of cnt
  output six;				// assert when cnt = 0x5

  ////////////////////////////////////////////////////////
  // Declare any needed internal signals of type logic //
  //////////////////////////////////////////////////////
  wire [3:0] CarryO;
  wire [3:0] S;
  wire [3:0] zero;
  logic not1;
  
  ///////////////////////////////////////////////////////
  // Use vectored instantiation to place the 4 AND   //
  // gates that knock the count down to zero when we //
  // hit 1/100th of a second                        //
  ///////////////////////////////////////////////////
  assign zero = 4'b0;
  FA FA3[3:0] (.A(cnt), .B(zero), .Cin({CarryO[2:0], 1'b1}), .S(S), .Cout(CarryO));
  
  ////////////////////////////////////////////////////
  // Implement logic (ANDs/ORs used to detect when //
  // cnt == 0x5 (only need to detect the 1's)     //
  /////////////////////////////////////////////////
  assign six = (cnt == 4'h5) ? 1'b1: 1'b0;
  not not0(not1, six);
  and iAND3[3:0] (nxt_cnt, not1, S);

 
endmodule