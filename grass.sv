module  grass( input[9:0] DrawX, DrawY,
				output logic grass_on);
				
always_comb
begin
		
		if(DrawX>=10& DrawX<13)
		begin
			if(DrawY>=10 & DrawY <20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY <35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=13 & DrawX<16)
		begin
			if(DrawY>=10 & DrawY<12)
				grass_on<=1'b1;
			else if(DrawY>=14 & DrawY<16)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<27)
				grass_on<=1'b1;
			else if(DrawY>=29 & DrawY<31)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=16 & DrawX<19)
		begin
			if(DrawY>=10 & DrawY<12)
				grass_on<=1'b1;
			else if(DrawY>=14 & DrawY<16)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<27)
				grass_on<=1'b1;
			else if(DrawY>=29 & DrawY<31)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=19 & DrawX<22)
		begin
			if(DrawY>=10 & DrawY<16)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<31)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		
		else if(DrawX>=25 & DrawX<28)
		begin
			if(DrawY>=25 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=28 & DrawX<31)
		begin
			if(DrawY>=25 & DrawY<28)
				grass_on<=1'b1;
			else if(DrawY>=32 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=31 & DrawX<34)
		begin
			if(DrawY>=10 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<28)
				grass_on<=1'b1;
			else if(DrawY>=32 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=34 & DrawX<37)
		begin
			if(DrawY>=25 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		
		else if(DrawX>=40 & DrawX<43)
		begin
			if(DrawY>=10 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		
		else if(DrawX>=43 & DrawX<46)
		begin
			if(DrawY>=10 & DrawY<13)
				grass_on<=1'b1;
			else if(DrawY>=17 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<28)
				grass_on<=1'b1;
			else if(DrawY>=32 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=46 & DrawX<49)
		begin
			if(DrawY>=10 & DrawY<13)
				grass_on<=1'b1;
			else if(DrawY>=15 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<28)
				grass_on<=1'b1;
			else if(DrawY>=32 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=49 & DrawX<52)
		begin
			if(DrawY>=10 & DrawY<13)
				grass_on<=1'b1;
			else if(DrawY>=15 & DrawY<17)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		
		else if(DrawX>=55 & DrawX<58)
		begin
			if(DrawY>=10 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<35)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=58 & DrawX<61)
		begin
			if(DrawY>=10 & DrawY<13)
				grass_on<=1'b1;
			else if(DrawY>=17 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<27)
				grass_on<=1'b1;
			else if(DrawY>=29 & DrawY<31)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=61 & DrawX<64)
		begin
			if(DrawY>=10 & DrawY<13)
				grass_on<=1'b1;
			else if(DrawY>=15 & DrawY<20)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<27)
				grass_on<=1'b1;
			else if(DrawY>=29 & DrawY<31)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=64& DrawX<67)
		begin
			if(DrawY>=10 & DrawY<13)
				grass_on<=1'b1;
			else if(DrawY>=15 & DrawY<17)
				grass_on<=1'b1;
			else if(DrawY>=25 & DrawY<31)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		
		else if(DrawX>=70& DrawX<73)
		begin
			if(DrawY>=10 & DrawY<15)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=73& DrawX<76)
		begin
			if(DrawY>=13 & DrawY<15)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=76& DrawX<79)
		begin
			if(DrawY>=13 & DrawY<20)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
		else if(DrawX>=79& DrawX<82)
		begin
			if(DrawY>=10 & DrawY<15)
				grass_on<=1'b1;
			else
				grass_on<=1'b0;
		end
			
		else
		grass_on<=1'b0;
		
		
end
endmodule

