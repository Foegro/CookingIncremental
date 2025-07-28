if (invincible <= 0) {
	for (var i = 0; i < array_length(stack); i++) {
		instance_create_depth(food_origin_x+sin(i/5+tower_time)*i*power(1.075,i),food_origin_y-12*i,0,obj_food_dropped).image_index = stack[i]
	}
	stack = []
	state = states.stun_flying
	stun = 80
	invincible = 90
	hspeed = sign(x-other.x)*max_spd
	vspeed = -12/1.5
	y--
	sprite_index = spr_player_stun
	image_index = 0
}