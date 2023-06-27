shader_type canvas_item;

uniform vec4 color1 : source_color;
uniform vec4 color2 : source_color;

void fragment() {
    vec4 color = color1;
    vec2 pixl = (SCREEN_UV+vec2(0.5,0.5))*SCREEN_PIXEL_SIZE*3.0;
    if (sin(TIME * pixl.x) > 0.0){
        color = color2;
    }
    COLOR.rgb = color.rgb;
}
