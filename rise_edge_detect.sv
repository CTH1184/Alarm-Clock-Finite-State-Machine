/////////////////////////////////////////////////////////
// rise_edge_detect.sv:  This design implements a     //
// circuit that interfaces to a PB swtich and  	     //
// gives a 1 clk wide puse on a rise of the signal. //
//                                                 //
// Student 1 Name: << Charles Harrington >>       //
// Student 2 Name: << Enter name if applicable >>//
//////////////////////////////////////////////////
module rise_edge_detect(
  input clk,			// hook to CLK of flops
  input rst_n,			// hook to PRN
  input sig,			// signal we are detecting a rising edge on
  output sig_rise		// high for 1 clock cycle on rise of sig
);

	//////////////////////////////////////////
	// Declare any needed internal signals //
	////////////////////////////////////////
	logic notLastSig;
	logic firstFlip;
	logic secondFlip;
	logic thirdFlip;
	
	
	///////////////////////////////////////////////////////
	// Instantiate flops to synchronize and edge detect //
	/////////////////////////////////////////////////////
	
	d_ff F1(.clk(clk), .D(sig), .CLRN(1'b1), .PRN(rst_n), .Q(firstFlip));
	d_ff F2(.clk(clk), .D(firstFlip), .CLRN(1'b1), .PRN(rst_n), .Q(secondFlip));
	d_ff F3(.clk(clk), .D(secondFlip), .CLRN(1'b1), .PRN(rst_n), .Q(thirdFlip));
	
	//////////////////////////////////////////////////////////
	// Infer any needed logic (data flow) to form sig_rise //
	////////////////////////////////////////////////////////
	
    not(notLastSig, thirdFlip);
	and and1(sig_rise, secondFlip, notLastSig);
	
endmodule