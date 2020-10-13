#version 300 es
precision highp float;
uniform sampler2D originalSampler;

uniform vec2 videoRes;
uniform vec4 renderArea;

layout(location = 0) out vec4 copyOut;

void main() {
  if (gl_FragCoord[0] < renderArea.x) {
    copyOut = vec4(0.0, 0.0, 0.0, 1.0);
  } else if (gl_FragCoord[0] > renderArea.z) {
    copyOut = vec4(0.0, 0.0, 0.0, 1.0);
  } else if ((gl_FragCoord[1] < renderArea.y) || (gl_FragCoord[1] > renderArea.w)) {
    copyOut = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    copyOut = texture(originalSampler, vec2((gl_FragCoord[0] - renderArea.x) / videoRes.x, 1.0 - ((gl_FragCoord[1] - renderArea.y) / videoRes.y)));
  }
}