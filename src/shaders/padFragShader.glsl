#version 300 es

precision highp float;

uniform sampler2D originalSampler;
uniform vec2 videoRes;

ivec2 start = ivec2(${padding}, ${padding});
layout(location = 0) out vec4 padOut;

void main() {
  ivec2 end = ivec2(videoRes.x + ${padding}.0, videoRes.y + ${padding}.0);
  ivec2 outC = ivec2(gl_FragCoord[0], gl_FragCoord[1]);

  if (any(lessThan(outC, start)) || any(greaterThanEqual(outC, end))) {
    padOut = vec4(0.0, 0.0, 0.0, 0.0);
  } else {
    float x = gl_FragCoord[0] - 4.0;
    float y = gl_FragCoord[1] - 4.0;
    vec2 coords = vec2(x / videoRes.x, y / videoRes.y);
    padOut = texture(originalSampler, coords) * 255.0;
    // padOut = vec4(x, y, coords.r, coords.g);
  }
}