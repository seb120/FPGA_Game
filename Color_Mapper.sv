module  color_mapper ( input        [9:0] pacmanX, pacmanY, blue_ghostX, blue_ghostY,DrawX, DrawY, sprite_size, ch_X, ch_Y,
								input [9:0] onescoreX, onescoreY, twoscoreX, twoscoreY, 
								input [9:0] s1X, s1Y, c1X, c1Y, o1X, o1Y, r1X, r1Y, e1X, e1Y, lvl, 
								input [2:0] pacState,
								input [7:0] score, 
								input ch_on, res,
                       output logic [7:0]  Red, Green, Blue);
    
    logic sprite_on, pacsprite, bgsprite, chickensprite,onesprite, twosprite;
	 logic s_on, c_on, o_on, r_on, e_on;
	 logic [3:0] color_addr;
	 logic[23:0] color_data;
	 logic[63:0] data;
	 logic[9:0] blue_ghost_addr, pacman_addr, addr, chicken_addr,onescore_addr, twoscore_addr,s_addr, c_addr, o_addr, r_addr, e_addr;
	 logic[3:0] pacman_diff, blue_ghost_diff, chicken_diff, onescore_diff, twoscore_diff, s_diff, c_diff, o_diff, r_diff, e_diff;
	 logic[9:0] g2_addr,a2_addr,m2_addr,e2_addr,o2_addr,v2_addr,e3_addr,r2_addr, p2_addr,r3_addr,e4_addr,s2_addr,s3_addr,e5_addr,n2_addr,t2_addr,e6_addr,r4_addr;
	 logic[3:0] g2_diff,a2_diff,m2_diff,e2_diff,o2_diff,v2_diff,e3_diff,r2_diff, p2_diff,r3_diff,e4_diff,s2_diff,s3_diff,e5_diff,n2_diff,t2_diff,e6_diff,r4_diff;
	 logic g2_on,a2_on,m2_on,e2_on,o2_on,v2_on,e3_on,r2_on, p2_on,r3_on,e4_on,s2_on,s3_on,e5_on,n2_on,t2_on,e6_on,r4_on;
	 logic[9:0] t1_addr, t5_addr, t3_addr, t4_addr, t6_addr, t7_addr, t8_addr;
	 logic[3:0] t1_diff, t5_diff, t3_diff, t4_diff, t6_diff, t7_diff, t8_diff;
	 logic t1_on, t5_on, t3_on, t4_on, t6_on, t7_on, t8_on;
	 logic lvl_on, l1_on, l2_on, l3_on;
	 logic[9:0] lvl_addr, l1_addr, l2_addr, l3_addr;
	 logic[3:0] lvl_diff, l1_diff, l2_diff, l3_diff;
	 logic grid_on;
	 logic grass_on;
	 grid background(.*);
	 sprite_table sprites(.*);	
	 color_table colors(.*);
	 grass grassback(.*);
	 
	 logic[9:0] g2X=270;
	 logic[9:0] a2X=290;
	 logic[9:0] m2X=310;
	 logic[9:0] e2X=330;
	 logic[9:0] o2X=270;
	 logic[9:0] v2X=290;
	 logic[9:0] e3X=310;
	 logic[9:0] r2X=330;
	 logic[9:0] p2X=270;
	 logic[9:0] r3X=290;
	 logic[9:0] e4X=310;
	 logic[9:0] s2X=330;
	 logic[9:0] s3X=350;
	 logic[9:0] e5X=270;
	 logic[9:0] n2X=290;
	 logic[9:0] t2X=310;
	 logic[9:0] e6X=330;
	 logic[9:0] r4X=350;
	 
	 logic[9:0] g2Y=200;
	 logic[9:0] a2Y=200;
	 logic[9:0] m2Y=200;
	 logic[9:0] e2Y=200;
	 logic[9:0] o2Y=220;
	 logic[9:0] v2Y=220;
	 logic[9:0] e3Y=220;
	 logic[9:0] r2Y=220;
	 logic[9:0] p2Y=240;
	 logic[9:0] r3Y=240;
	 logic[9:0] e4Y=240;
	 logic[9:0] s2Y=240;
	 logic[9:0] s3Y=240;
	 logic[9:0] e5Y=260;
	 logic[9:0] n2Y=260;
	 logic[9:0] t2Y=260;
	 logic[9:0] e6Y=260;
	 logic[9:0] r4Y=260;
	 
	 logic[9:0] t1X=100;
	 logic[9:0] t1Y=100;
	 logic[9:0] t5X=50;
	 logic[9:0] t5Y=200;
	 logic[9:0] t3X=100;
	 logic[9:0] t3Y=300;
	 logic[9:0] t4X=50;
	 logic[9:0] t4Y=400;
	 logic[9:0] t6X=540;
	 logic[9:0] t6Y=100;
	 logic[9:0] t7X=590;
	 logic[9:0] t7Y=300;
	 logic[9:0] t8X=540;
	 logic[9:0] t8Y=400;
	 
	 logic[9:0] lvlX=540;
	 logic[9:0] lvlY=260;
	 logic[9:0] l1X=520;
	 logic[9:0] l1Y=240;
	 logic[9:0] l2X=540;
	 logic[9:0] l2Y=240;
	 logic[9:0] l3X=560;
	 logic[9:0] l3Y=240;
	 
	 
	 
	///pacman
	 assign pacman_addr = (DrawY - pacmanY);
	 assign pacman_diff = ((DrawX - pacmanX));
	 
	 ///shit
	 assign blue_ghost_addr = (DrawY - blue_ghostY);
	 assign blue_ghost_diff = ((DrawX - blue_ghostX));
	 
	///chicken
	 assign chicken_addr = (DrawY - ch_Y);
	 assign chicken_diff = ((DrawX - ch_X));
	 
	 assign onescore_addr= (DrawY - onescoreY);
	 assign onescore_diff = ((DrawX - onescoreX));
	 
	 assign twoscore_addr= (DrawY - twoscoreY);
	 assign twoscore_diff = ((DrawX - twoscoreX));
	 
	 assign s_addr= (DrawY - s1Y);
	 assign s_diff = ((DrawX - s1X));
	 
	 assign c_addr= (DrawY - c1Y);
	 assign c_diff = ((DrawX - c1X));
	 
	 assign o_addr= (DrawY - o1Y);
	 assign o_diff = ((DrawX - o1X));
	 
	 assign r_addr= (DrawY - r1Y);
	 assign r_diff = ((DrawX - r1X));
	 
	 assign e_addr= (DrawY - e1Y);
	 assign e_diff = ((DrawX - e1X));
	 
	 assign g2_addr= (DrawY - g2Y);
	 assign g2_diff = ((DrawX - g2X));
	 
	 assign a2_addr= (DrawY - a2Y);
	 assign a2_diff = ((DrawX - a2X));
	 
	 assign m2_addr= (DrawY - m2Y);
	 assign m2_diff = ((DrawX - m2X));
	 
	 assign e2_addr= (DrawY - e2Y);
	 assign e2_diff = ((DrawX - e2X));
	 
	 assign o2_addr= (DrawY - o2Y);
	 assign o2_diff = ((DrawX - o2X));
	 
	 assign v2_addr= (DrawY - v2Y);
	 assign v2_diff = ((DrawX - v2X));
	 
	 assign e3_addr= (DrawY - e3Y);
	 assign e3_diff = ((DrawX - e3X));
	 
	 assign r2_addr= (DrawY - r2Y);
	 assign r2_diff = ((DrawX - r2X));
	 
	 assign p2_addr= (DrawY - p2Y);
	 assign p2_diff = ((DrawX - p2X));
	 
	 assign r3_addr= (DrawY - r3Y);
	 assign r3_diff = ((DrawX - r3X));
	 
	 assign e4_addr= (DrawY - e4Y);
	 assign e4_diff = ((DrawX - e4X));
	 
	 assign s2_addr= (DrawY - s2Y);
	 assign s2_diff = ((DrawX - s2X));
	 
	 assign s3_addr= (DrawY - s3Y);
	 assign s3_diff = ((DrawX - s3X));
	 
	 assign e5_addr= (DrawY - e5Y);
	 assign e5_diff = ((DrawX - e5X));
	 
	 assign n2_addr= (DrawY - n2Y);
	 assign n2_diff = ((DrawX - n2X));
	 
	 assign t2_addr= (DrawY - t2Y);
	 assign t2_diff = ((DrawX - t2X));
	 
	 assign e6_addr= (DrawY - e6Y);
	 assign e6_diff = ((DrawX - e6X));
	 
	 assign r4_addr= (DrawY - r4Y);
	 assign r4_diff = ((DrawX - r4X));
	 
	 assign t1_addr= (DrawY - t1Y);
	 assign t1_diff = ((DrawX - t1X));
	 
	 assign t5_addr= (DrawY - t5Y);
	 assign t5_diff = ((DrawX - t5X));
	 
	 assign t3_addr= (DrawY - t3Y);
	 assign t3_diff = ((DrawX - t3X));
	 
	 assign t4_addr= (DrawY - t4Y);
	 assign t4_diff = ((DrawX - t4X));
	 
	 assign t6_addr= (DrawY - t6Y);
	 assign t6_diff = ((DrawX - t6X));
	 
	 assign t7_addr= (DrawY - t7Y);
	 assign t7_diff = ((DrawX - t7X));
	 
	 assign t8_addr= (DrawY - t8Y);
	 assign t8_diff = ((DrawX - t8X));
	 
	 assign lvl_addr= (DrawY - lvlY);
	 assign lvl_diff = ((DrawX - lvlX));
	 
	 assign l1_addr= (DrawY - l1Y);
	 assign l1_diff = ((DrawX - l1X));
	 
	 assign l2_addr= (DrawY - l2Y);
	 assign l2_diff = ((DrawX - l2X));
	 
	 assign l3_addr= (DrawY - l3Y);
	 assign l3_diff = ((DrawX - l3X));
	 
	 
    always_comb
    begin:on_proc
        if ( (DrawX >=pacmanX) & (DrawX < (pacmanX+sprite_size)) &
				 (DrawY >=pacmanY) & (DrawY < (pacmanY+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b1;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		  end else if ( (DrawX >=blue_ghostX) & (DrawX < (blue_ghostX+sprite_size)) &
				 (DrawY >=blue_ghostY) & (DrawY < (blue_ghostY+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b1;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t1X) & (DrawX < (t1X+sprite_size)) &
				 (DrawY >=t1Y) & (DrawY < (t1Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b1;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t5X) & (DrawX < (t5X+sprite_size)) &
				 (DrawY >=t5Y) & (DrawY < (t5Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b1;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t3X) & (DrawX < (t3X+sprite_size)) &
				 (DrawY >=t3Y) & (DrawY < (t3Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b1;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t4X) & (DrawX < (t4X+sprite_size)) &
				 (DrawY >=t4Y) & (DrawY < (t4Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b1;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t6X) & (DrawX < (t6X+sprite_size)) &
				 (DrawY >=t6Y) & (DrawY < (t6Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b1;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t7X) & (DrawX < (t7X+sprite_size)) &
				 (DrawY >=t7Y) & (DrawY < (t7Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b1;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t8X) & (DrawX < (t8X+sprite_size)) &
				 (DrawY >=t8Y) & (DrawY < (t8Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b1;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=lvlX) & (DrawX < (lvlX+sprite_size)) &
				 (DrawY >=lvlY) & (DrawY < (lvlY+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b1;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		end else if ( (DrawX >=l1X) & (DrawX < (l1X+sprite_size)) &
				 (DrawY >=l1Y) & (DrawY < (l1Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b1;
				l2_on=1'b0;
				l3_on=1'b0;
		 end else if ( (DrawX >=l2X) & (DrawX < (l2X+sprite_size)) &
				 (DrawY >=l2Y) & (DrawY < (l2Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b1;
				l3_on=1'b0;
			end else if ( (DrawX >=l3X) & (DrawX < (l3X+sprite_size)) &
				 (DrawY >=l3Y) & (DrawY < (l3Y+sprite_size)) )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b1;
		  end else if ( (DrawX >=g2X) & (DrawX < (g2X+sprite_size)) &
				 (DrawY >=g2Y) & (DrawY < (g2Y+sprite_size)) &res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b1;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		  end else if ( (DrawX >=a2X) & (DrawX < (a2X+sprite_size)) &
				 (DrawY >=a2Y) & (DrawY < (a2Y+sprite_size)) &res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b1;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		  end else if ( (DrawX >=m2X) & (DrawX < (m2X+sprite_size)) &
				 (DrawY >=m2Y) & (DrawY < (m2Y+sprite_size)) &res)
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b1;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		  end else if ( (DrawX >=e2X) & (DrawX < (e2X+sprite_size)) &
				 (DrawY >=e2Y) & (DrawY < (e2Y+sprite_size)) &res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b1;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		 end else if ( (DrawX >=o2X) & (DrawX < (o2X+sprite_size)) &
				 (DrawY >=o2Y) & (DrawY < (o2Y+sprite_size)) &res)
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b1;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=v2X) & (DrawX < (v2X+sprite_size)) &
				 (DrawY >=v2Y) & (DrawY < (v2Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b1;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=e3X) & (DrawX < (e3X+sprite_size)) &
				 (DrawY >=e3Y) & (DrawY < (e3Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b1;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=r2X) & (DrawX < (r2X+sprite_size)) &
				 (DrawY >=r2Y) & (DrawY < (r2Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b1;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=p2X) & (DrawX < (p2X+sprite_size)) &
				 (DrawY >=p2Y) & (DrawY < (p2Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b1;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=r3X) & (DrawX < (r3X+sprite_size)) &
				 (DrawY >=r3Y) & (DrawY < (r3Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b1;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=e4X) & (DrawX < (e4X+sprite_size)) &
				 (DrawY >=e4Y) & (DrawY < (e4Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b1;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=s2X) & (DrawX < (s2X+sprite_size)) &
				 (DrawY >=s2Y) & (DrawY < (s2Y+sprite_size)) &res)
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b1;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=s3X) & (DrawX < (s3X+sprite_size)) &
				 (DrawY >=s3Y) & (DrawY < (s3Y+sprite_size)) &res)
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b1;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=e5X) & (DrawX < (e5X+sprite_size)) &
				 (DrawY >=e5Y) & (DrawY < (e5Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b1;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=n2X) & (DrawX < (n2X+sprite_size)) &
				 (DrawY >=n2Y) & (DrawY < (n2Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b1;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=t2X) & (DrawX < (t2X+sprite_size)) &
				 (DrawY >=t2Y) & (DrawY < (t2Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b1;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=e6X) & (DrawX < (e6X+sprite_size)) &
				 (DrawY >=e6Y) & (DrawY < (e6Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b1;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end else if ( (DrawX >=r4X) & (DrawX < (r4X+sprite_size)) &
				 (DrawY >=r4Y) & (DrawY < (r4Y+sprite_size))&res )
		  begin 
            sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b1;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		  end else if ( (DrawX >=ch_X) & (DrawX < (ch_X+sprite_size)) &
				 (DrawY >=ch_Y) & (DrawY < (ch_Y+sprite_size)) & ch_on )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b1;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=onescoreX) & (DrawX < (onescoreX+sprite_size)) &
				 (DrawY >=onescoreY) & (DrawY < (onescoreY+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b1;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=twoscoreX) & (DrawX < (twoscoreX+sprite_size)) &
				 (DrawY >=twoscoreY) & (DrawY < (twoscoreY+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b1;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=s1X) & (DrawX < (s1X+sprite_size)) &
				 (DrawY >=s1Y) & (DrawY < (s1Y+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b1;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=c1X) & (DrawX < (c1X+sprite_size)) &
				 (DrawY >=c1Y) & (DrawY < (c1Y+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b1;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=o1X) & (DrawX < (o1X+sprite_size)) &
				 (DrawY >=o1Y) & (DrawY < (o1Y+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b1;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=r1X) & (DrawX < (r1X+sprite_size)) &
				 (DrawY >=r1Y) & (DrawY < (r1Y+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b1;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
	  end else if ( (DrawX >=e1X) & (DrawX < (e1X+sprite_size)) &
				 (DrawY >=e1Y) & (DrawY < (e1Y+sprite_size)) )
		  begin
				sprite_on = 1'b1;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b1;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
			end
		  else begin
            sprite_on = 1'b0;
				pacsprite = 1'b0;
				bgsprite = 1'b0;
				chickensprite=1'b0;
				onesprite=1'b0;
				twosprite=1'b0;
				s_on=1'b0;
				c_on=1'b0;
				o_on=1'b0;
				r_on=1'b0;
				e_on=1'b0;
				g2_on=1'b0;
				a2_on=1'b0;
				m2_on=1'b0;
				e2_on=1'b0;
				o2_on=1'b0;
				v2_on=1'b0;
				e3_on=1'b0;
				r2_on=1'b0;
				p2_on=1'b0;
				r3_on=1'b0;
				e4_on=1'b0;
				s2_on=1'b0;
				s3_on=1'b0;
				e5_on=1'b0;
				n2_on=1'b0;
				t2_on=1'b0;
				e6_on=1'b0;
				r4_on=1'b0;
				t1_on=1'b0;
				t5_on=1'b0;
				t3_on=1'b0;
				t4_on=1'b0;
				t6_on=1'b0;
				t7_on=1'b0;
				t8_on=1'b0;
				lvl_on=1'b0;
				l1_on=1'b0;
				l2_on=1'b0;
				l3_on=1'b0;
		  end
		  
		  
		  
     end 
	  
	  
    always_comb
	 begin
	 addr = 10'b0000000000;	
			if ((sprite_on == 1'b1)) 
			begin
				addr = 10'b0000000000;
				if(bgsprite == 1'b1) 
				begin
					addr = 10'b0000100000 + blue_ghost_addr;
				end 
				else if(pacsprite==1'b1) 
				begin
					addr = 10'b0000000000 + pacman_addr;
				end 
				else if(t1_on==1'b1) 
				begin
					addr = 10'b0110100000 + t1_addr;
				end 
				else if(t5_on==1'b1) 
				begin
					addr = 10'b0110100000 + t5_addr;
				end 
				else if(t3_on==1'b1) 
				begin
					addr = 10'b0110100000 + t3_addr;
				end 
				else if(t4_on==1'b1) 
				begin
					addr = 10'b0110100000 + t4_addr;
				end 
				else if(t6_on==1'b1) 
				begin
					addr = 10'b0110100000 + t6_addr;
				end 
				else if(t7_on==1'b1) 
				begin
					addr = 10'b0110100000 + t7_addr;
				end 
				else if(t8_on==1'b1) 
				begin
					addr = 10'b0110100000 + t8_addr;
				end 
				else if(lvl_on==1'b1) 
				begin
					if(lvl==1)
					addr = 10'b0001100000 + lvl_addr;
					else if(lvl==2) 
					addr = 10'b0001110000 + lvl_addr;
					else if(lvl==3) 
					addr = 10'b0010000000 + lvl_addr;
					else
					addr = 10'b0001100000 + lvl_addr;
				end 
				else if(l1_on==1'b1) 
				begin
					addr = 10'b0111010000 + l1_addr;
				end 
				else if(l2_on==1'b1) 
				begin
					addr = 10'b0110010000 + l2_addr;
				end 
				else if(l3_on==1'b1) 
				begin
					addr = 10'b0111010000 + l3_addr;
				end 
				
				else if(chickensprite==1'b1) 
				begin
					if(pacState==3'b000)
					addr = 10'b0000010000+chicken_addr;
					else if(pacState==3'b001)
					addr = 10'b0000110000+chicken_addr;
					else
					addr = 10'b0001000000+chicken_addr;
				end 
				else if(onesprite==1'b1) 
				begin
					case(score%10)
					0:addr = 10'b0001010001+onescore_addr;
					1:addr = 10'b0001100000+onescore_addr;
					2:addr = 10'b0001110000+onescore_addr;
					3:addr = 10'b0010000000+onescore_addr;
					4:addr = 10'b0010010000+onescore_addr;
					5:addr = 10'b0010100000+onescore_addr;
					6:addr = 10'b0010110000+onescore_addr;
					7:addr = 10'b0011000000+onescore_addr;
					8:addr = 10'b0011010000+onescore_addr;
					9:addr = 10'b0011100000+onescore_addr;
					default: addr = 10'b0001010000+onescore_addr;
					endcase
				end 
				else if(twosprite==1'b1) 
				begin
					case((score/10)%10)
					0:addr = 10'b0001010001+onescore_addr;
					1:addr = 10'b0001100000+onescore_addr;
					2:addr = 10'b0001110000+onescore_addr;
					3:addr = 10'b0010000000+onescore_addr;
					4:addr = 10'b0010010000+onescore_addr;
					5:addr = 10'b0010100000+onescore_addr;
					6:addr = 10'b0010110000+onescore_addr;
					7:addr = 10'b0011000000+onescore_addr;
					8:addr = 10'b0011010000+onescore_addr;
					9:addr = 10'b0011100000+onescore_addr;
					default: addr = 10'b0001010000+onescore_addr;
					endcase
				end 
				else if(s_on==1'b1) 
				begin
					addr = 10'b0101110000+ s_addr;
				end 
				else if(c_on==1'b1) 
				begin
					addr = 10'b0100000000 + c_addr;
				end 
				else if(o_on==1'b1) 
				begin
					addr = 10'b0101010000 + o_addr;
				end 
				else if(r_on==1'b1) 
				begin
					addr = 10'b0101100000  + r_addr;
				end 
				else if(e_on==1'b1) 
				begin
					addr = 10'b0100010000 + e_addr;
				end 
				else if(g2_on==1'b1)
				begin
					addr = 10'b0100100000+g2_addr;
				end
				else if(a2_on==1'b1)
				begin
					addr = 10'b0011110000+a2_addr;
				end
				else if(m2_on==1'b1)
				begin
					addr = 10'b0100110000+m2_addr;
				end
				else if(e2_on==1'b1)
				begin
					addr = 10'b0100010000+e2_addr;
				end
				else if(o2_on==1'b1)
				begin
					addr = 10'b0101010000+o2_addr;
				end
				else if(v2_on==1'b1)
				begin
					addr = 10'b0110010000+v2_addr;
				end
				else if(e3_on==1'b1)
				begin
					addr = 10'b0100010000+e3_addr;
				end
				else if(r2_on==1'b1)
				begin
					addr = 10'b0101100000+r2_addr;
				end
				else if(p2_on==1'b1)
				begin
					addr = 10'b0111000000+p2_addr;
				end
				else if(r3_on==1'b1)
				begin
					addr = 10'b0101100000+r3_addr;
				end
				else if(e4_on==1'b1)
				begin
					addr = 10'b0100010000+e4_addr;
				end
				else if(s2_on==1'b1)
				begin
					addr = 10'b0101110000+s2_addr;
				end
				else if(s3_on==1'b1)
				begin
					addr = 10'b0101110000+s3_addr;
				end
				else if(e5_on==1'b1)
				begin
					addr = 10'b0100010000+e5_addr;
				end
				else if(n2_on==1'b1)
				begin
					addr = 10'b0101000000+n2_addr;
				end
				else if(t2_on==1'b1)
				begin
					addr = 10'b0110000000+t2_addr;
				end
				else if(e6_on==1'b1)
				begin
					addr = 10'b0100010000+e6_addr;
				end
				else if(r4_on==1'b1)
				begin
					addr = 10'b0101100000+r4_addr;
				end
				else
				begin
				addr = 10'b0;
				end
			end
	  end
	 
	 
    always_comb
    begin:RGB_Display
			if ((sprite_on == 1'b1)) 
				begin
				if(pacsprite) begin
					case (pacman_diff[3:0])
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(chickensprite) begin
					case (chicken_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(t1_on) begin
					case (t1_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(t5_on) begin
					case (t5_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(t3_on) begin
					case (t3_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(t4_on) begin
					case (t4_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(t6_on) begin
					case (t6_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(t7_on) begin
					case (t7_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(t8_on) begin
					case (t8_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(lvl_on) begin
					case (lvl_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(l1_on) begin
					case (l1_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(l2_on) begin
					case (l2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(l3_on) begin
					case (l3_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(onesprite) begin
					case (onescore_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(twosprite) begin
					case (twoscore_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(s_on) begin
					case (s_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(c_on) begin
					case (c_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(o_on) begin
					case (o_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(r_on) begin
					case (r_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(e_on) begin
					case (e_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(g2_on) begin
					case (g2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(a2_on) begin
					case (a2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(m2_on) begin
					case (m2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(e2_on) begin
					case (e2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(o2_on) begin
					case (o2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(v2_on) begin
					case (v2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(e3_on) begin
					case (e3_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(r2_on) begin
					case (r2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(p2_on) begin
					case (p2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(r3_on) begin
					case (r3_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(e4_on) begin
					case (e4_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(s2_on) begin
					case (s2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(s3_on) begin
					case (s3_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
					end else if(e5_on) begin
					case (e5_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(n2_on) begin
					case (n2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(t2_on) begin
					case (t2_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(e6_on) begin
					case (e6_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else if(r4_on) begin
					case (r4_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end else begin
					case (blue_ghost_diff)
						4'b0000: color_addr = data[63:60];
						4'b0001: color_addr = data[59:56];
						4'b0010: color_addr = data[55:52];
						4'b0011: color_addr = data[51:48];
						4'b0100: color_addr = data[47:44];
						4'b0101: color_addr = data[43:40];
						4'b0110: color_addr = data[39:36];
						4'b0111: color_addr = data[35:32];
						4'b1000: color_addr = data[31:28];
						4'b1001: color_addr = data[27:24];
						4'b1010: color_addr = data[23:20];
						4'b1011: color_addr = data[19:16];
						4'b1100: color_addr = data[15:12];
						4'b1101: color_addr = data[11:8];
						4'b1110: color_addr = data[7:4];
						4'b1111: color_addr = data[3:0];
					endcase
				end
				Red = color_data[23:16];
				Green = color_data[15:8];
				Blue = color_data[7:0];
				
				end 
				else if(grass_on)
				begin
				color_addr = 3'b0;
				Red = 8'h00;
				Green = 8'h4c;
				Blue = 8'h00;
				end
				else if(grid_on)
				begin
				color_addr = 3'b0;
				Red = 8'h43;
				Green = 8'h1a;
				Blue = 8'h00;
				end
				else begin
				color_addr = 3'b0;
				Red = 8'h00;
				Green = 8'h80;
				Blue = 8'h00;
				end 
			end       
////////////////////////////////	 

endmodule
