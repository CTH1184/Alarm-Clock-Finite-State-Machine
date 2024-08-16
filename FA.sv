///////////////////////////////////////////////////
// FA.sv  This design will take in 3 bits       //
// and add them to produce a sum and carry out //
////////////////////////////////////////////////
module FA(
  input 	A,B,Cin,	// three input bits to be added
  output	S,Cout		// Sum and carry out
);

	/////////////////////////////////////////////////
	// Declare any internal signals as type logic //
	///////////////////////////////////////////////
	logic node1, node2, node3;
	
	/////////////////////////////////////////////////
	// Implement Full Adder as structural verilog //
	///////////////////////////////////////////////
	
	xor XOR1(node2, A, B);
	xor XOR2 (S, node2, Cin);
	
	and AND1(node1, A, B);
	and AND2(node3, node2, Cin);
	or OR1(Cout, node1, node3);
	
	
	
endmodule