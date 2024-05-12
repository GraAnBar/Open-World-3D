shader_type sky;

uniform vec3 sky_color: source_color;
uniform sampler2D cloudy;
uniform float density = 0.3;
uniform vec2 wind = vec2(3.2, 0);

void sky() {
	vec2 direction = (TIME * wind) * 0.002;
	vec3 final_color = mix(sky_color, texture(cloudy, SKY_COORDS + direction).rgb, density);
	COLOR = final_color;
}
