module Game_entity_table( input Reset, frame_clk,
					input [7:0] key,
               output [9:0]  pacmanX, pacmanY, blue_ghostX, blue_ghostY, ch_X, ch_Y,Size,
					output [9:0] onescoreX, onescoreY, twoscoreX, twoscoreY,
					output [9:0] s1X, s1Y, c1X, c1Y, o1X, o1Y, r1X, r1Y, e1X, e1Y, 
				   output [2:0]pacmanState,
					output logic ch_on, res,
				   output [9:0] lvl,
					output [7:0]score);
    
    logic [9:0] topleft_X_Pos, X_Motion, topleft_Y_Pos, Y_Motion, sprite_Size;
	 logic [9:0] bg_topleft_X_Pos, bg_X_Motion, bg_topleft_Y_Pos, bg_Y_Motion;
	 logic [9:0] ch_topleft_X_Pos, ch_X_Motion, ch_topleft_Y_Pos, ch_Y_Motion, ch_startX;
	 logic [9:0] onescore_X, onescore_Y, twoscore_X, twoscore_Y;
	 logic [9:0] s1_X, s1_Y, c1_X, c1_Y, o1_X, o1_Y, r1_X, r1_Y, e1_X, e1_Y; 
	 logic ch_bottom=1'b0;
	 logic ch_hit=1'b0;
	 logic resout=1'b0;
	 logic [2:0] pacstate,pacstateout;
	 logic [7:0]scoreval=8'b00000000;
	 enum logic [1:0] {A, B, C, D}curr_state, next_state;//motion of poop
	 enum logic [2:0] {chA, chB, chC, chD, chR}ch_curr_state, ch_next_state;//motion of chicken 
	 enum logic [2:0] {ch1, ch2, ch3, ch4, ch5, ch6, ch7, ch8}chXstate, chNXstate;//start x value of chicken
	 logic hit=1'b0;
    parameter [9:0] X_Center=320;  // Center position on the X axis
    parameter [9:0] Y_Center=470;  // Center position on the Y axis
    parameter [9:0] X_Step=2;      // Step size on the X axis
    parameter [9:0] Y_Step=2;      // Step size on the Y axis
	 logic [9:0] level_step=1;
    assign sprite_Size = 16;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Piggy
        if (Reset)  // Asynchronous Reset
        begin 
            Y_Motion <= 10'd0; //Ball_Y_Step;
				X_Motion <= 10'd0; //Ball_X_Step;
				topleft_Y_Pos <= Y_Center-(sprite_Size/2);
				topleft_X_Pos <= X_Center-(sprite_Size/2);
				curr_state = A;
        end
           
        else 
        begin 
			curr_state=next_state;
			unique case (curr_state)
			A : if(key==8'h2c)
				next_state = B;
			B : if(hit)
				next_state = C;
				else if (ch_hit)
				next_state = D;
			C : next_state = A;
			D : next_state = A;
			endcase
			
			case (curr_state)
				//Reset
				A:
				begin
					bg_topleft_X_Pos<=topleft_X_Pos;
					bg_topleft_Y_Pos<= 460;
					hit<=1'b0;
				end
				B:
				begin
					bg_topleft_X_Pos<=bg_topleft_X_Pos;
					bg_topleft_Y_Pos<= bg_topleft_Y_Pos-Y_Step;
				end
				C:
				begin
					bg_topleft_X_Pos<=topleft_X_Pos;
					bg_topleft_Y_Pos<= 460;
				end
				D:
				begin
					bg_topleft_X_Pos<=topleft_X_Pos;
					bg_topleft_Y_Pos<= 460;
				end
				default:
				begin
					bg_topleft_X_Pos<=topleft_X_Pos;
					bg_topleft_Y_Pos<= 400;
				end
			endcase
	
			  if (topleft_X_Pos<=194)
			  begin 
			   if (key==8'h07)
				X_Motion <= X_Step;
				else
				X_Motion <= 10'd0;;
			  end 
			  
			  else if(topleft_X_Pos+sprite_Size>=446)
			  begin 
				if (key==8'h04)
						X_Motion <=(~ (X_Step) + 1'b1);
				else
					X_Motion <=10'd0;;
				end
			  else if (key==8'h04)
						X_Motion <=(~ (X_Step) + 1'b1);
			  else if (key==8'h07)
						X_Motion <= X_Step;
			  else
			  begin
				X_Motion <=10'd0;
			  end
					
				
				 
				if(bg_topleft_Y_Pos-sprite_Size<=5)
					hit<=1'b1;
				 topleft_Y_Pos <= (topleft_Y_Pos + Y_Motion);	 // Update ball position
				 topleft_X_Pos <= (topleft_X_Pos + X_Motion);
			
		end  
    end
    
	 always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_pacman
        if (Reset)  // Asynchronous Reset
        begin 
		  ch_topleft_X_Pos<=320;
		  ch_X_Motion<=0;
		  ch_topleft_Y_Pos<=0;
		  ch_Y_Motion<=0;
		  ch_on<=1'b0;
		  ch_curr_state<=chR;
		  scoreval<=8'b00000000;
		  pacstateout<=3'b000;
		  end
		  else 
        begin 
			ch_curr_state<=ch_next_state;
			unique case (ch_curr_state)
			chA :	ch_next_state <= chB;
			chB : if(ch_bottom)
					ch_next_state <= chC;
					else if(ch_hit)
					ch_next_state <= chD;
			chC : ch_next_state <= chR;
			chD : ch_next_state <= chA;
			chR : if(key==8'h28)
					ch_next_state <= chA;
					else
					ch_next_state <= chR;
			endcase
			
			case (ch_curr_state)
				//Reset
				chA:
				begin
					ch_topleft_X_Pos<=ch_startX;
					ch_topleft_Y_Pos<= 0;
					ch_bottom<=1'b0;
					ch_on<=1'b0;
					pacstateout<=pacstate;
					resout<=1'b0;
				end
				chR:
				begin
					ch_topleft_X_Pos<=ch_startX;
					ch_topleft_Y_Pos<= 0;
					ch_bottom<=1'b0;
					ch_on<=1'b0;
					scoreval<=8'b00000000;
					pacstateout<=pacstate;
					resout<=1'b1;
				end
				chB:
				begin
					ch_topleft_X_Pos<=ch_topleft_X_Pos;
					ch_topleft_Y_Pos<= ch_topleft_Y_Pos+level_step;
					ch_on<=1'b1;
					ch_bottom<=1'b0;
					pacstateout<=pacstateout;
					resout<=1'b0;
				end
				chC:
				begin
					ch_topleft_X_Pos<=ch_topleft_X_Pos;
					ch_topleft_Y_Pos<= 0;
					ch_on<=1'b0;
					ch_bottom<=1'b0;
					pacstateout<=pacstateout;
					resout<=1'b0;
				end
				chD:
				begin
					ch_topleft_X_Pos<=ch_topleft_X_Pos;
					ch_topleft_Y_Pos<= 0;
					ch_on<=1'b0;
					ch_bottom<=1'b0;
					scoreval<=scoreval+1;
					pacstateout<=pacstateout;
					resout<=1'b0;
				end
				default:
				begin
					ch_topleft_X_Pos<=ch_topleft_X_Pos;
					ch_topleft_Y_Pos<= 0;
					ch_on<=1'b0;
					ch_bottom<=1'b0;
					pacstateout<=pacstateout;
					resout<=1'b0;
				end
				endcase
				
				if(ch_topleft_Y_Pos+sprite_Size>=450)
					ch_bottom<=1'b1;
		end
			
	end
	  
always_comb
    begin: hits
        if (((ch_topleft_X_Pos)> bg_topleft_X_Pos-13) &
				((ch_topleft_X_Pos)< (bg_topleft_X_Pos+sprite_Size-2)) &
				(ch_topleft_Y_Pos< bg_topleft_Y_Pos+sprite_Size) & (ch_topleft_Y_Pos>bg_topleft_Y_Pos))  // Asynchronous Reset
        begin 
			ch_hit<=1'b1;
		  end
		  else
		  begin
			ch_hit<=1'b0;
		  end
	end
	 
 always_ff @ (posedge Reset or posedge frame_clk )
 begin
        if (Reset)  // Asynchronous Reset
        begin
		  chXstate=ch1;
		  end
			else 
			begin 
			  chXstate=chNXstate;
			  unique case (chXstate)
			  ch1 : chNXstate <= ch2;
			  ch2 : chNXstate <= ch3;
			  ch3 : chNXstate <= ch4;
			  ch4 : chNXstate <= ch5;
			  ch5 : chNXstate <= ch6;
			  ch6 : chNXstate <= ch7;
			  ch7 : chNXstate <= ch8;
			  ch8 : chNXstate <= ch1;
			  endcase
			  case (chXstate)
				//Reset
				ch1:
				begin
				ch_startX<=320;
				pacstate<=3'b000;
				end
				ch2:
				begin
				ch_startX<=210;
				pacstate<=3'b001;
				end
				ch3:
				begin
				ch_startX<=280;
				pacstate<=3'b001;
				end
				ch4:
				begin
				ch_startX<=380;
				pacstate<=3'b011;
				end
				ch5:
				begin
				ch_startX<=400;
				pacstate<=3'b001;
				end
				ch6:
				begin
				ch_startX<=420;
				pacstate<=3'b011;
				end
				ch7:
				begin
				ch_startX<=250;
				pacstate<=3'b011;
				end
				ch8:
				begin
				ch_startX<=350;
				pacstate<=3'b000;
				end
				endcase
			end
		  
		  
end

always_ff @ (posedge Reset or posedge frame_clk )
begin
if (Reset)
begin
	onescore_X<=550;
	onescore_Y<=200;
	twoscore_X<=530;
	twoscore_Y<=200;
	s1_X<=500;
	s1_Y<=180;
	c1_X<=520;
	c1_Y<=180;
	o1_X<=540;
	o1_Y<=180;
	r1_X<=560;
	r1_Y<=180;
	e1_X<=580;
	e1_Y <=180;
end
else
begin
	onescore_X<=550;
	onescore_Y<=200;
	twoscore_X<=530;
	twoscore_Y<=200;
	s1_X<=500;
	s1_Y<=180;
	c1_X<=520;
	c1_Y<=180;
	o1_X<=540;
	o1_Y<=180;
	r1_X<=560;
	r1_Y<=180;
	e1_X<=580;
	e1_Y <=180;
end
	
end

always_ff @ (posedge Reset or posedge frame_clk )
begin
	if (Reset)
		level_step<=1;
	else if(key==8'h1e)
		level_step<=1;
	else if(key==8'h1f)
		level_step<=2;
	else if(key==8'h20)
		level_step<=3;
	else	
		level_step<=level_step;
end
		

    assign pacmanX = topleft_X_Pos;
    assign pacmanY = topleft_Y_Pos;
	 assign blue_ghostX = bg_topleft_X_Pos;
	 assign blue_ghostY = bg_topleft_Y_Pos;
	 assign ch_X = ch_topleft_X_Pos;
	 assign ch_Y = ch_topleft_Y_Pos;
	 assign onescoreX=onescore_X;
	 assign onescoreY=onescore_Y;
	 assign twoscoreX=twoscore_X;
	 assign twoscoreY=twoscore_Y;
	 assign s1X=s1_X;
	 assign s1Y=s1_Y;
	 assign c1X=c1_X;
	 assign c1Y=c1_Y;
	 assign o1X=o1_X;
	 assign o1Y=o1_Y;
	 assign r1X=r1_X;
	 assign r1Y=r1_Y;
	 assign e1X=e1_X;
	 assign e1Y=e1_Y;
    assign Size = sprite_Size;
    assign score=scoreval;
	 assign pacmanState=pacstateout;
	 assign res=resout;
	 assign lvl=level_step;
endmodule
