/*
	--- Style ---
	01. Shader type declaration
	02. Render mode declaration
	03. Uniforms
	04. Constants
	05. Varying
	06. Other functions
	07. Vertex Function
	08. Fragment function
	09. Light function
*/

shader_type canvas_item;
render_mode unshaded;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

/**
 * This is a documentation comment.
 * These lines will appear in the inspector when hovering the shader parameter
 * named "Something".
 * You can use [b]BBCode[/b] [i]formatting[/i] in the comment.
 * [u]underline[/u], [s]crossed out[/s], [color=blue]blue color[/color], [br]
 * [url]https://www.bbcode.org[/url]
 */
uniform vec4 color : source_color = vec4(1.0,0.5,0.5,1.0);
uniform float amount : hint_range(0.0, 1.0, 0.1);

const float CONSTANT = 2.0;
varying float varying_variable;

void casting_converting() {
	// Conversion must be done explicitly via constructors.
	float a = 2.0;		// Direct assign
	float b = float(2); // Explicit cast
	int	  c = int(2.9); // Conversion
}

bool is_true() {
	return true;
}


void vertex() {
	// Called for every vertex the material is visible on.
}


void fragment() {
	// Called for every pixel the material is visible on.
}


void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
}
