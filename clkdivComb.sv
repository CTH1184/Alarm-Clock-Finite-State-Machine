//////////////////////////////////////////////////////////
// clkdivComb.sv:  This design implements a 19-bit     //
// incrementor and logic to detect 1/100th sec 	      //
// assuming 50MHz clk                                //
// Count needs to reset when it hits 1/100th		//
//                                                 //
// Student 1 Name: << Enter you name here >>      //
// Student 2 Name: << Enter name if applicable >>//
//////////////////////////////////////////////////
module clkdivComb(divcnt, nxt_divcnt, hundrethSec);

  input [18:0] divcnt;	// with a 50MHz clk you need 19-bits for 0.01 sec
  output[18:0] nxt_divcnt;  	// incremented version of divcnt
  output hundrethSec;				// assert when divcnt = 0x7A11F
  
  ////////////////////////////////////////////////////////
  // Declare any needed internal signals of type logic //
  //////////////////////////////////////////////////////
  logic [18:0] CarryIn, CarryOut;
  wire [18:0] S;
  
  ///////////////////////////////////////////////////////
  // Use vectored instantiation to place the 18 AND   //
  // gates that knock the count down to zero when we //
  // hit 1/100th of a second                        //
  ///////////////////////////////////////////////////

  assign CarryIn = {CarryOut[17:0], 1'b1};
  FA FA19[18:0] (.A(divcnt), .B(1'b0), .Cin(CarryIn), .S(S), .Cout(CarryOut));

  
  ///////////////////////////////////////////////////////
  // Implement logic (ANDs/ORs used to detect when    //
  // divcnt == 0x7A11F (only need to detect the 1's) //
  ////////////////////////////////////////////////////
  assign hundrethSec = (divcnt == 19'h7A11F) ? 1'b1: 1'b0;
  
  and iAND19[18:0] (nxt_divcnt, !hundrethSec, S);


endmodule