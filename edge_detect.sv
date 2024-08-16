/////////////////////////////////////////////////////////
// rise_edge_detect.sv:  This design implements a     //
// circuit that interfaces to a PB swtich and  	     //
// gives a 1 clk wide puse on a rise of the signal. //
//                                                 //
// Student 1 Name: << Enter name if applicable >> //
// Student 2 Name: << Enter name if applicable >>//
//////////////////////////////////////////////////
module edge_detect(
  input clk,			// hook to CLK of flops
  input rst_n,			// hook to PRN
  input sig,			// signal we are detecting a rising edge on
  output sig_rise		// high for 1 clock cycle on rise of sig
);

	//////////////////////////////////////////
	// Declare any needed internal signals //
	////////////////////////////////////////
	logic ff1;
	logic ff2;
	logic lastsig;
	
	
	///////////////////////////////////////////////////////
	// Instantiate flops to synchronize and edge detect //
	/////////////////////////////////////////////////////
	d_ff FF1(.clk(clk), .D(sig), .CLRN(rst_n), .PRN(1'b1), .Q(ff1));
	d_ff FF2(.clk(clk), .D(ff1), .CLRN(rst_n), .PRN(1'b1), .Q(ff2));
	d_ff FF3(.clk(clk), .D(ff2), .CLRN(rst_n), .PRN(1'b1), .Q(lastsig));
	
	//////////////////////////////////////////////////////////
	// Infer any needed logic (data flow) to form sig_rise //
	////////////////////////////////////////////////////////
	
	assign sig_rise = ff2 ^ lastsig;
	
endmodule