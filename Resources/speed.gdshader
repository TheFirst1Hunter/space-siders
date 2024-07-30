shader_type canvas_item;

uniform vec2 center = vec2(0.5, 0.5);
uniform sampler2D noise;
uniform float sample_radius: hint_range(0.0, 1.0) = 0.5;
uniform vec4 line_color: source_color = vec4(1.0);
uniform float center_radius: hint_range(0.0, 1.0) = 0.5;
uniform float time : hint_range(0.0, 100.0) = 0.0; // Animation time

const float pi = 3.14159265359;

void fragment() {
    float t = TIME; // Adjust animation speed here

    // Rotating center
    vec2 animated_center = center + vec2(cos(t), sin(t)) * 0.1; // Adjust rotation radius here

    // Pulsating sample radius
    float animated_sample_radius = sample_radius * (1.0 + sin(t * 2.0) * 0.2); // Adjust pulsation amplitude here

    // Changing line color
    vec4 animated_line_color = line_color * (1.0 + sin(t) * 0.2); // Adjust color variation amplitude here

    // Growing and shrinking center radius
    float animated_center_radius = center_radius * (1.0 + sin(t * 3.0) * 0.2); // Adjust growth/shrink amplitude here

    vec2 dist = UV - animated_center;
    float angle = atan(dist.y / dist.x);
    vec2 sample = vec2(animated_sample_radius * cos(angle), animated_sample_radius * sin(angle));
    float noise_value = texture(noise, sample).r;
    vec4 color = mix(animated_line_color, vec4(0.0), noise_value);
    color = mix(color, vec4(0.0), 1.0 - length(dist) - animated_center_radius);
    COLOR = color;
}
