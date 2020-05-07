#include "chu_init.h"
#include "gpio_cores.h"
#include "xadc_core.h"
#include "vga_core.h"
#include "ps2_core.h"
#include <stdlib.h>
#include "timer_core.h"

//TimerCore timer(get_slot_addr(BRIDGE_BASE, S0_SYS_TIMER));
GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));
XadcCore adc(get_slot_addr(BRIDGE_BASE, S5_XDAC));
Ps2Core ps2(get_slot_addr(BRIDGE_BASE, S11_PS2));
FrameCore frame(FRAME_BASE);
GpvCore bar(get_sprite_addr(BRIDGE_BASE, V7_BAR));
GpvCore gray(get_sprite_addr(BRIDGE_BASE, V6_GRAY));
SpriteCore ghost(get_sprite_addr(BRIDGE_BASE, V3_GHOST), 1024);
SpriteCore mouse(get_sprite_addr(BRIDGE_BASE, V1_MOUSE), 1024);
OsdCore osd(get_sprite_addr(BRIDGE_BASE, V2_OSD));


//Used to convert integers 0-9 to their char equivalent
char IntToChar(int num){
	switch (num){
		case 0: return '0';
		case 1: return '1';
		case 2: return '2';
		case 3: return '3';
		case 4: return '4';
		case 5: return '5';
		case 6: return '6';
		case 7: return '7';
		case 8: return '8';
		case 9: return '9';
		default: return '0';
	}
}

//generate the background for the play area
void setBackgroundColor(int color) {
	for(int y = 40; y <= 440; y++){
		for(int x = 20; x <= 620; x++){
			frame.wr_pix(x, y, color);
		}
	}
}

//function for gameplay, includes mouse movement, timer, ghost spawner
int play(Ps2Core *ps2, SpriteCore *mouse, SpriteCore *ghost, XadcCore *adc, OsdCore *osd) {

	setBackgroundColor(0xf2f);	//change background to blue

	//initializing variables
	int score[2] = {0,0};
	int x_mouse, y_mouse,
		x_ghost, y_ghost,
		lbtn, rbtn, xmov, ymov,
		time = 300, timer = 0;
	bool clickedGhost = false;

	char score_num[2] = {'0', '0'};
	char time_num[4] = {0, '0', ':', '0'};
	char sens_num[2] = {0,0};

	// get random ghost position
	srand (now_ms());
	x_ghost = (rand() % 580) + 20;
	y_ghost = (rand() % 380) + 40;
	ghost->move_xy(x_ghost, y_ghost);

	for(int j = 0; j < 2; j++){	//display score
		osd->wr_char(j+8, 1, score_num[j],0);
	}
	for(int l = 0; l < 4; l++){	//display time
		osd->wr_char(l+405, 0, time_num[l], 0);
	}


	//Gameplay, ends when time = 0;
	while(time >= 0) {
		timer++;
		//every tenth of a second, add 1
		if(timer == 5640){
			time--;
			timer = 0;
			for(int l = 0; l < 4; l++){	//display time
				osd->wr_char(l+405, 0, time_num[l], 0);
			}
			sens_num[0] = IntToChar((int(adc->read_adc_in(0))%10));
			sens_num[1] = IntToChar( (int(adc->read_adc_in(0)*10))%10 );
		}
		time_num[3] = IntToChar(time % 10);
		time_num[1] = IntToChar((time % 100) / 10);
		time_num[0] = IntToChar((time % 1000) / 100);

		for(int k = 0; k<2; k++){	//display sensitivity
			osd->wr_char(425+k, 0, sens_num[k], 0);
		}


		// get mouse input
		if(ps2->get_mouse_activity(&lbtn, &rbtn, &xmov, &ymov)) {
			// update mouse position based based on movement and xadc sensitivity
			x_mouse += xmov * 3 * (adc->read_adc_in(0) + 0.5); // add 0.5 to have ability to inc/dec default speed
			y_mouse -= ymov * 3 * (adc->read_adc_in(0) + 0.5);

			// keep mouse within the boundaries
			if(x_mouse > 620) x_mouse = 620;
			else if(x_mouse < 20) x_mouse = 20;
			if(y_mouse > 440) y_mouse = 440;
			else if(y_mouse < 40) y_mouse = 40;

			// update position
			mouse->move_xy(x_mouse, y_mouse);

			// check if mouse is clicking ghost
			// if clicked, change and update ghost position, increase score
			ps2->get_mouse_activity(&lbtn, &rbtn, &xmov, &ymov);
			clickedGhost = (lbtn == 1) && (x_mouse < x_ghost + 10 && x_mouse > x_ghost - 10) && (y_mouse < y_ghost + 10 && y_mouse > y_ghost - 10);
			if(clickedGhost) {		//generate new ghost and increase score (both number and text)
				x_ghost = (rand() % 580) + 20;
				y_ghost = (rand() % 380) + 40;
				ghost->move_xy(x_ghost, y_ghost);
				score[1]++;
				if(score[1] == 10){
					score[1] = 0;
					score[0]++;
					score_num[0] = IntToChar(score[0]);
				}
				score_num[1] = IntToChar(score[1]);

				//display score
				for(int j = 0; j < 2; j++){
					osd->wr_char(j+8, 1, score_num[j],0);
				}
			}
		}
	} //end of while loop

	int result = score[0]*10 + score[1];
	return result;
}

void gameOver(Ps2Core *ps2, OsdCore *osd){

	setBackgroundColor(0xfff);	//set background color

	bool cont = false;
	int lbtn, rbtn,
		xmov, ymov;
	char disp[19] = {'R', 'I', 'G','H','T',0,'C', 'L','I','C','K',0,'T','O',0,'P','L','A','Y'};

	osd->set_color(0x111, 0xfff);
	for(int i = 0; i < 19; i++){
		osd->wr_char(50 + i, 10, disp[i], 0);
	}

	while(!cont)
		cont = (ps2->get_mouse_activity(&lbtn, &rbtn, &xmov, &ymov)) && (rbtn == 1);

	// display play again text
	for(int i = 0; i < 19; i++){
		disp[i] = 0;
		osd->wr_char(50 + i, 10, disp[i], 0);
	}
}

int main(){

	ps2.init();

	//score keeping
	int high_score = 0;
	int score = 0;

	//text generation
	char best_text[5] = {'B','E','S', 'T', ':'};
	char high_score_text[2] = {'0', '0'};
	char score_text[6] = {'S', 'C', 'O', 'R', 'E', ':'};
	char time_text[5] = {'T', 'I', 'M', 'E', ':'};
	char sens_text[5]={'S','E','N','S',':'};

	for(int i = 2; i < 8; i++)	//display "SCORE:"
		osd.wr_char(i, 1, score_text[i - 2], 0);
	for(int k = 0; k < 5; k++)	//display "TIME:"
		osd.wr_char(k + 400, 0, time_text[k], 0);
	for(int j = 0; j<5; j++)	//display "SENS:"
		osd.wr_char(j+420, 0, sens_text[j], 0);


	osd.set_color(0xf00, 0x000);
	for(int i = 0; i < 5; i++)
		osd.wr_char(i + 3, 0, best_text[i], 0);
	osd.set_color(0xf00, 0x000);
	for(int i = 0; i < 2; i++)
		osd.wr_char(i + 8, 0, high_score_text[i], 0);

	while(1){
		mouse.bypass(0);
		ghost.bypass(0);
		osd.set_color(0xfff, 0x000);
		score = play(&ps2, &mouse, &ghost, &adc, &osd);	//play game
		mouse.bypass(1);
		ghost.bypass(1);

		// check if high score
		if(score > high_score){
			high_score = score;
			high_score_text[0] = IntToChar(high_score / 10);
			high_score_text[1] = IntToChar(high_score % 10);
			osd.set_color(0xf00, 0x000);
			// display new text
			for(int i = 0; i < 2; i++){
				osd.wr_char(i + 8, 0, high_score_text[i], 0);
			}
		}

		// game over
		gameOver(&ps2, &osd);
	}

	return 0;
}
