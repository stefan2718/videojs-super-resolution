const generate = require('videojs-generate-rollup-config');
const copy = require('rollup-plugin-copy');
const glslify = require('rollup-plugin-glslify');

// see https://github.com/videojs/videojs-generate-rollup-config
// for options
const options = {
  plugins(defaults) {
    return {
      browser: [
        ...defaults.browser,
        glslify({
          compress: false,
        }),
        copy({
          targets: [
            {
              src: [
                "node_modules/video.js/dist/video-js.css",
                "node_modules/video.js/dist/video.min.js",
                "node_modules/videojs-mux/dist/videojs-mux.js",
              ],
              dest: "dist"
            }
          ]
        }),
      ],
      module: [
        ...defaults.module,
        glslify({
          compress: false,
        }),
      ],
      test: defaults.test,
    };
  }
};
const config = generate(options);

// Add additonal builds/customization here!

// export the builds to rollup
export default Object.values(config.builds);
