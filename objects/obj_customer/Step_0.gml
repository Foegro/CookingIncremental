switch (state) {
	case customer_states.walking:
		switch (move_data.pattern) {
			case customer_move_pattern.linear:
				hspeed = -move_data.speed
				break
			case customer_move_pattern.bounds:
				if (x < move_data.bound_l) hspeed = move_data.speed
				if (x > move_data.bound_r) hspeed = -move_data.speed
				image_xscale = sign(hspeed)
				break
		}
		break
	case customer_states.eating:
		sprite_index = eat_sprite
		speed = 0
		path_end()
		eat_timer--
		if (eat_timer <= 0) state = customer_states.leaving
		break
	case customer_states.leaving:
		sprite_index = leave_sprite
		switch (move_data.leave_pattern) {
			case customer_leave_pattern.left:
				hspeed = -5
				break
			case customer_leave_pattern.down:
				vspeed = 5
				break
		}
		break
}
if (bbox_right < -64 || bbox_top > room_height+64) instance_destroy()