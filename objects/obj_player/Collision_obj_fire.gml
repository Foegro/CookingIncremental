if (y == ystart) {
	for (var i = 0; i < array_length(stack); i++) {
		instance_create_depth(food_origin_x+sin(i/5+tower_time)*i*power(1.075,i),food_origin_y-12*i,0,obj_food_dropped).image_index = stack[i]
	}
	stack = []
	state = states.stun
	stun = 80
	sprite_index = spr_player_stun
	image_speed = 1
}