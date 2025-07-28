if (y >= obj_player.ystart) {
	instance_create_depth(x,obj_player.ystart,0,obj_fire,{
		lifetime: 12
	})
	instance_destroy()
}
if (hit) {
	vspeed += 0.5
}