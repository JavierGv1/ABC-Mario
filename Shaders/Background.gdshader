shader_type canvas_item;

void fragment() {
	COLOR = texture(TEXTURE, vec2(UV.x + TIME * 0.05, UV.y));
}
