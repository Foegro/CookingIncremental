if (y < other.bbox_top+16) {
	other.stack[array_length(other.stack)] = image_index
	instance_destroy()
} else {
	hspeed = sign(x-other.x)*6
	hit = true
}