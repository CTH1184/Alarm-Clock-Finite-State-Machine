/////////////////////////////////////////////////////////
// div10Comb.sv:  This design implements a 4-bit      //
// incrementor and logic to divide by 10 	         //
//                                                  //
// Student 1 Name: << Enter you name here >>       //
// Student 2 Name: << Enter name if applicable >> //
///////////////////////////////////////////////////
module div10Comb(cnt, nxt_cnt, ten);

  input [3:0] cnt;			// div10 requires a 4-bit counter
  output [3:0] nxt_cnt;  	// incremented version of cnt
  output ten;				// assert when count = 0x9
  
  ////////////////////////////////////////////////////////
  // Declare any needed internal signals of type logic //
  //////////////////////////////////////////////////////
  logic [3:0] CarryOut;
  wire [3:0] S;
  wire [3:0] zero;
  logic not1;
  
  ///////////////////////////////////////////////////////
  // Use vectored instantiation to place the 4 AND    //
  // gates that knock the count down to zero when we //
  // hit 1/100th of a second                        //
  ///////////////////////////////////////////////////
  assign zero = 4'b0;
  FA FA3[3:0] (.A(cnt), .B(zero), .Cin({CarryOut[2:0], 1'b1}), .S(S), .Cout(CarryOut));
  
  ////////////////////////////////////////////////////
  // Implement logic (ANDs/ORs used to detect when //
  // cnt == 0x9 (only need to detect the 1's)     //
  /////////////////////////////////////////////////
  assign ten = (cnt == 4'h9) ? 1'b1: 1'b0;
  not not0(not1, ten);
  and iAND3[3:0] (nxt_cnt, not1, S);

 
endmodule