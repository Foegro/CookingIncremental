alarm[2] = special_guest_cooldown
instance_create_depth(room_width+128,room_height-16,obj_player.depth+0.5,obj_customer,{
	walk_sprite: spr_customer_lanino_walk,
	eat_sprite: spr_customer_lanino_eat,
	leave_sprite: spr_customer_lanino_walk,
	move_data: {
		pattern: customer_move_pattern.bounds,
		speed: 5,
		bound_l: 64,
		bound_r: room_width-64,
		leave_pattern: customer_leave_pattern.down
	}
})