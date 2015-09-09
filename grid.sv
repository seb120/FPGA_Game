module  grid( input[9:0] DrawX, DrawY,
				output logic grid_on);
				

always_comb
begin
		
		if(DrawX>=170& DrawX<175)
			grid_on<=1'b1;
		else if(DrawX>=175 & DrawX<185)
		begin
			if(DrawY>=0 & DrawY <20)
				grid_on<=1'b1;
			else if(DrawY>=40 & DrawY <60)
				grid_on<=1'b1;
			else if(DrawY>=80 & DrawY <100)
				grid_on<=1'b1;
			else if(DrawY>=120 & DrawY <140)
				grid_on<=1'b1;
			else if(DrawY>=160 & DrawY <180)
				grid_on<=1'b1;
			else if(DrawY>=200 & DrawY <220)
				grid_on<=1'b1;
			else if(DrawY>=240 & DrawY <260)
				grid_on<=1'b1;
			else if(DrawY>=280 & DrawY <300)
				grid_on<=1'b1;
			else if(DrawY>=320 & DrawY <340)
				grid_on<=1'b1;
			else if(DrawY>=360 & DrawY <380)
				grid_on<=1'b1;
			else if(DrawY>=400 & DrawY <420)
				grid_on<=1'b1;
			else if(DrawY>=440 & DrawY <460)
				grid_on<=1'b1;
			else
				grid_on<=1'b0;
		end
		else if(DrawX>=185& DrawX<190)
			grid_on<=1'b1;
		else if(DrawX>=450& DrawX<455)
			grid_on<=1'b1;
		else if(DrawX>=455 & DrawX<465)
		begin
			if(DrawY>=0 & DrawY <20)
				grid_on<=1'b1;
			else if(DrawY>=40 & DrawY <60)
				grid_on<=1'b1;
			else if(DrawY>=80 & DrawY <100)
				grid_on<=1'b1;
			else if(DrawY>=120 & DrawY <140)
				grid_on<=1'b1;
			else if(DrawY>=160 & DrawY <180)
				grid_on<=1'b1;
			else if(DrawY>=200 & DrawY <220)
				grid_on<=1'b1;
			else if(DrawY>=240 & DrawY <260)
				grid_on<=1'b1;
			else if(DrawY>=280 & DrawY <300)
				grid_on<=1'b1;
			else if(DrawY>=320 & DrawY <340)
				grid_on<=1'b1;
			else if(DrawY>=360 & DrawY <380)
				grid_on<=1'b1;
			else if(DrawY>=400 & DrawY <420)
				grid_on<=1'b1;
			else if(DrawY>=440 & DrawY <460)
				grid_on<=1'b1;
			else
				grid_on<=1'b0;
		end
		else if(DrawX>=465& DrawX<470)
			grid_on<=1'b1;
		
		else
				grid_on<=1'b0;
		
		
end
endmodule
				