// note that this is NOT a program - it is a hardware description that gets turned into logic!

module segCdec
(
	input [3:0] D,
	output segC
);

and AND1(segC, !D[2], D[1], !D[0]);

endmodule
