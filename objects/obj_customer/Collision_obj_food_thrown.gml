if (state != customer_states.leaving) {
	state = customer_states.eating
	eat_timer = max_eat_timer
	instance_destroy(other)
}