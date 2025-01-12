/*
	Bitwise Example
	
	Demonstrates how to create a grid pattern without using loops,
	relying on bitwise operators.
*/
shader_type canvas_item;

uniform vec2 grid_size = vec2(16.0, 16.0);
uniform vec4 grid_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 background_color = vec4(0.0, 0.0, 0.0, 1.0);

/*
	Function to create the grid using AND operator
	
	- Checks whether the least significant bit (LSB) is 1 or 0
	- &1 == 1 is odd
	- &0 == 0 is even
*/
bool and_pattern(ivec2 cell) {
	return (cell.x & 1) == 0 && (cell.y & 1) == 0;
}

/*
	Function to create the grid using XOR operator
*/
bool xor_pattern(ivec2 cell) {
	return (cell.x ^ cell.y) % 2 == 0;
}

void fragment() {
	bool is_grid;
	// Convert the position to integer coordinates
	ivec2 cell = ivec2(floor(FRAGCOORD.xy / grid_size));

	is_grid = and_pattern(cell);
	is_grid = xor_pattern(cell);
	COLOR = is_grid ? grid_color : background_color;
}
