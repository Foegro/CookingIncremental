draw_self()
for (var i = 0; i < array_length(stack); i++) {
	draw_sprite(spr_food,stack[i],food_origin_x+sin(i/5+tower_time)*i*power(1.075,i),food_origin_y-12*i)
}