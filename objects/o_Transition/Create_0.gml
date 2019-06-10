//Size variables and mode setup

w = display_get_gui_width() + 64;
h = display_get_gui_height();
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 0;
target = room;
