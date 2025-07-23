switch (state) {
	case states.pre_trowing:
		image_speed = 0
		image_index = image_number-1
		state = states.throwing
		break
	case states.stun:
		image_speed = 0
		image_index = image_number-1
		break
}