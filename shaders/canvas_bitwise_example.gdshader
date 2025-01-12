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
	Function to create the grid using OR operator
	
	Example:
	  010		(binary of 2)
	| 011		(binary of 3)
	------
	  011		(binary of 3)
	
	- If either of the bits is 1 - result 1
	- If both bits are 0 - result 0
*/
bool or_pattern(ivec2 cell) {
	return (cell.x | cell.y) % 2 == 0;
}

/*
	Function to create the grid using XOR operator
	
	Example:
	  011		(binary of 3)
	^ 101		(binary of 5)
	------
	  011		(binary of 6)
*/
bool xor_pattern(ivec2 cell) {
	return (cell.x ^ cell.y) % 2 == 0;
}

/*
	Function to create the grid using Left shift operator
	
	Example:
	  00000010	(binary of 2)
	<< 3
	----------
	  00010000	(binary of 16)
*/
bool left_shift_pattern(ivec2 cell) {
	return ( (cell.x << (cell.y % 32)) % 2 ) == 0;
}

/*
	Function to create the grid using Right shift operator
	
	Example:
	  00010000	(binary of 16)
	>> 2
	----------
	  00000100	(binary of 4)
*/
bool right_shift_pattern(ivec2 cell) {
	return ( (cell.x >> (cell.y % 32)) % 2 ) == 0;
}

/*
	Function to create the grid using NOT operator
	
	Example:
	  00000010	(binary of 2)
	~
	----------
	  11111101	(binary of -3 in signed integers)
*/
bool not_pattern(ivec2 cell) {
	return ( (~cell.x & cell.y) % 2 ) == 0;
}

void fragment() {
	bool is_grid;
	// Convert the position to integer coordinates
	ivec2 cell = ivec2(floor(FRAGCOORD.xy / grid_size));

	is_grid = and_pattern(cell);
	is_grid = xor_pattern(cell);
	is_grid = or_pattern(cell);
	is_grid = left_shift_pattern(cell);
	is_grid = right_shift_pattern(cell);
	is_grid = not_pattern(cell);
	COLOR = is_grid ? grid_color : background_color;
}
