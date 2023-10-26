const CopyPlugin = require("copy-webpack-plugin")

module.exports = {
  mode: "development",
  plugins: [
    new CopyPlugin({
      patterns: [
        {
          from: "node_modules/@antoine-lizee/vad-web/dist/vad.worklet.bundle.min.js",
          to: "[name][ext]",
        },
        {
          from: "node_modules/@antoine-lizee/vad-web/dist/*.onnx",
          to: "[name][ext]",
        },
        { from: "node_modules/onnxruntime-web/dist/*.wasm", to: "[name][ext]" },
        { from: "src/index.html", to: "[name][ext]" },
      ],
    }),
  ],
  output: {
    clean: true,
  },
}
