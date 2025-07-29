if (state != customer_states.running) {
	state = customer_states.eating
	eat_timer = max_eat_timer
	instance_destroy(other)
}