// GLSL ES 3.00: include in a fragment shader with highp float precision.
uniform sampler2D u_wind;
uniform vec2 u_windMin;
uniform vec2 u_windMax;

vec2 decodeWind(ivec2 p) {
    vec4 bytes = round(texelFetch(u_wind, p, 0) * 255.0);
    vec2 normalized = vec2(bytes.r * 256.0 + bytes.g,
                           bytes.b * 256.0 + bytes.a) / 65535.0;
    return mix(u_windMin, u_windMax, normalized);
}

vec2 sampleWind(vec2 gridPosition) {
    ivec2 p = ivec2(floor(gridPosition));
    vec2 f = fract(gridPosition);
    vec2 lower = mix(decodeWind(p), decodeWind(p + ivec2(1, 0)), f.x);
    vec2 upper = mix(decodeWind(p + ivec2(0, 1)), decodeWind(p + ivec2(1, 1)), f.x);
    return mix(lower, upper, f.y);
}
