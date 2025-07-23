var l = keyboard_check(vk_left)
var r = keyboard_check(vk_right)
var j = keyboard_check_pressed(ord("X"))

var cap = max(4, array_length(stack)) + 3;
switch (jump_state) {
	case jump_states.none:
		if (r) {
			hspeed = ((cap - array_length(stack)) / cap) * max_spd
			sprite_index = spr_player_walk
			image_xscale = 1
		} else if (l) {
			hspeed = -((cap - array_length(stack)) / cap) * max_spd
			sprite_index = spr_player_walk
			image_xscale = -1
		} else {
			hspeed = 0
			sprite_index = spr_player_default
		}
		break
	case jump_states.squat:
}