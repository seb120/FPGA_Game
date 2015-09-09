module color_table ( input  [3:0] color_addr,
							output [23:0]	color_data
					 );
/*
	0000: green
	0001: Brown
	0010: skin
	0011: darker skin
	0100: grey
	0101: red-brown
	0110: light red-brown
	0111: white
	1000: dark red
	0001: orange
	1010: chicken
	1011: black
	1100: dark brown
	1101: medium brown
	1110: light brown
	1111: pink
	*/
	parameter ADDR_WIDTH = 4;
	parameter DATA_WIDTH =  24;
	logic [ADDR_WIDTH-1:0] addr_reg;
	
	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
		 //////////////////
        24'h008000, // 0000
        24'hb9886a, // 0001
		  24'hf5d1b9, // 0010
		  24'hffd7b1, // 0011
		  24'h303028, // 0100
		  24'h84583d, // 0101
		  24'hc29983, // 0110
		  24'hffffff,  // 0111
		  /////////////////// 
		  24'ha00000, // 1000
        24'hb9886a, // 1001
		  24'hf8f8c0, // 1010
		  24'h000000, // 1011
		  24'h431a00, // 1100
		  24'h63371d, // 1101
		  24'h874e2b, // 1110
		  24'hffbfbf  // 1111
        };

	assign color_data = ROM[color_addr];

endmodule  