//player input
if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A")) ;
key_right = keyboard_check(vk_right) || keyboard_check(ord("D")) ;
key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W")) ;

if (key_left) || (key_right) || (key_jump)
{
		controler = 0;	
	}
	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controler = 1;
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		controler = 1;
		key_jump = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;

}
//calculating movement
var move = key_right-key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,o_wall)) && key_jump
{
	vsp=-10;
	
}

//horizontal collision
if(place_meeting(x+hsp,y,o_wall))
{
	while (!place_meeting(x+sign(hsp),y,o_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;	
}

x = x + hsp;

//vertical collision
if(place_meeting(x,y+vsp,o_wall))
{
	while (!place_meeting(x,y+sign(vsp),o_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;	
}

y = y + vsp;


//Animation
if (!place_meeting(x,y+1,o_wall))
{
	sprite_index = s_player_A;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1 ; else image_index = 0 ;
	
}
else
{
image_speed = 1;
	if( hsp == 0)
	{
		sprite_index=s_player;
	}
	else
	{
	sprite_index=s_player_running;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);