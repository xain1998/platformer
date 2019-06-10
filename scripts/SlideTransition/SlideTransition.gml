/// @desc SlideTrasition(mode,targetroom)
/// @arg Mode sets trnsition mode between next, restart and goto.
/// @arg Target sets target room when using the goto mode.

with (o_Transition)
{
	mode = argument[0];

	if (argument_count > 1) target = argument[1];
	
}