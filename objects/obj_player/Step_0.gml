var l = keyboard_check(vk_left)
var r = keyboard_check(vk_right)
var j = keyboard_check_pressed(ord("X"))
var t = keyboard_check_pressed(ord("Y")) || keyboard_check_pressed(ord("Z"))

var cap = max(4, array_length(stack)) + 3;
switch (state) {
	case states.standing:
		food_origin_x = x
		food_origin_y = bbox_top+12
		if (r) {
			hspeed = ((cap - array_length(stack)) / cap) * max_spd
			sprite_index = spr_player_walk
			image_xscale = 1
			image_speed = ((cap - array_length(stack))) / cap
		} else if (l) {
			hspeed = -((cap - array_length(stack)) / cap) * max_spd
			sprite_index = spr_player_walk
			image_xscale = -1
			image_speed = ((cap - array_length(stack))) / cap
		} else {
			hspeed = 0
			sprite_index = spr_player_default
		}
		if (j) {
			jump_speed = hspeed
			jump_dir = r-l
			state = states.squat
			jump_timer = 1+array_length(stack)*2
		}
		if (t && array_length(stack) >= 1) {
			state = states.pre_trowing
			sprite_index = spr_player_throw
			image_speed = 1
			hspeed = 0
		}
		break
	case states.squat:
		food_origin_x = x
		food_origin_y = bbox_top+12
		hspeed = 0
		jump_timer--
		sprite_index = spr_player_squat
		if (jump_timer <= 0) {
			hspeed = jump_speed
			vspeed = (-12 + ((array_length(stack) / cap) * 5))/1.5
			sprite_index = spr_player_jump
			image_speed = 0.5 + (0.5 * ((10 - min(array_length(stack), 10)) / 10))
	        if (hspeed != 0)
	            image_speed *= sign(hspeed)
			state = states.jump
		}
		break
	case states.jump:
		food_origin_x = x
		food_origin_y = bbox_top+12
		vspeed += 0.5
		if (y+vspeed > ystart) {
			state = states.standing
			y = ystart
			vspeed = 0
		}
		break
	case states.pre_trowing:
		food_origin_x = x
		food_origin_y = y
	case states.throwing:
		food_origin_x = x
		food_origin_y = y
		instance_create_depth(x,y,0,obj_food_thrown).image_index = stack[0]
		array_delete(stack,0,1)
		if (array_length(stack) == 0) {
			state = states.standing
		}
		break
	case states.stun:
		stun--
		if (stun <= 0) state = states.standing
		break
}
if (state != states.pre_trowing && state != states.throwing) tower_time = current_time/100
for (var i = 0; i < array_length(stack); i++) {
	var inst = collision_rectangle(food_origin_x+sin(i/5+tower_time )*i*power(1.1,i)-16,food_origin_y-12*i-16,food_origin_x+sin(i/5+current_time/100)*i*power(1.075,i)+16,food_origin_y-12*i+16,obj_food,false,false)
	if (inst != noone) {
		stack[array_length(stack)] = inst.image_index
		instance_destroy(inst)
	}
}