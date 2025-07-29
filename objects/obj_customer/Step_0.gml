switch (state) {
	case customer_states.walking:
		switch (move_data.pattern) {
			case customer_move_pattern.linear:
				hspeed = -move_data.speed
			break
		}
		break
	case customer_states.eating:
		sprite_index = eat_sprite
		speed = 0
		path_end()
		eat_timer--
		if (eat_timer <= 0) state = customer_states.running
		break
	case customer_states.running:
		sprite_index = run_sprite
		hspeed = -run_speed
		break
}
if (bbox_right < 0) instance_destroy()