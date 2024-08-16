// note that this is NOT a program - it is a hardware description that gets turned into logic!

module segDdec
(
	input [3:0] D,
	output segD
);
logic oAND1, oAND2, oAND3;

and iAND1(oAND1, D[2], !D[1], !D[0]);
and iAND2(oAND2, !D[2], !D[1], D[0]);
and iAND3(oAND3, D[2], D[1], D[0]);

or iOR1(segD, oAND1, oAND2, oAND3);

endmodule
