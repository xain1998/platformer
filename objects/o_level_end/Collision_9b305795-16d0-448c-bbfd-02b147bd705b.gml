/// @desc Move to next room

with (o_player)
{
	if (hascontrol)
	{
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,other.target);
		
	}
}

