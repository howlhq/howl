const fs = require("fs");
const { resolve } = require("path");

const HTMLWebpackPlugin = require("html-webpack-plugin");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");
const webpack = require("webpack");
const merge = require("webpack-merge");

const port = 4001;

const paths = {
  dist: resolve(__dirname, "dist"),
  src: resolve(__dirname, "web"),
};

const base = {
  context: paths.src,
  entry: "./main.tsx",
  module: {
    rules: [
      {
        type: "javascript/auto",
        test: /\.mjs$/,
        use: [],
      },
      {
        test: /\.(j|t)sx?$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            cacheDirectory: true,
            babelrc: false,
            presets: [
              ["@babel/preset-env", { targets: { browsers: "last 2 versions" } }],
              "@babel/preset-typescript",
              "@babel/preset-react",
            ],
            plugins: ["react-hot-loader/babel"],
          },
        },
      },
    ],
  },
  plugins: [
    new ForkTsCheckerWebpackPlugin({
      tsconfig: resolve(__dirname, "tsconfig.json"),
      tslint: resolve(__dirname, "tslint.json"),
    }),
  ],
  resolve: {
    extensions: [".ts", ".tsx", ".js", ".jsx", ".mjs"],
    modules: ["node_modules", paths.src],
  },
};

const dev = {
  devServer: {
    contentBase: paths.dist,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
      "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
      "Access-Control-Allow-Credentials": "true",
    },
    hot: true,
    https: {
      key: fs.readFileSync(resolve(__dirname, "priv/cert/selfsigned_key.pem")),
      cert: fs.readFileSync(resolve(__dirname, "priv/cert/selfsigned.pem")),
    },
    inline: true,
    port,
    publicPath: `https://localhost:${port}/`,
    // quiet: true,
  },
  mode: "development",
  output: {
    filename: "js/app.js",
    path: paths.dist,
    publicPath: `https://localhost:${port}/`,
  },
  plugins: [
    new ForkTsCheckerWebpackPlugin({
      tsconfig: resolve(__dirname, "tsconfig.json"),
      tslint: resolve(__dirname, "tslint.json"),
    }),
  ],
};

const prod = {
  mode: "production",
  output: {
    filename: "js/app.js",
    path: paths.dist,
    publicPath: "/",
  },
  plugins: [
    new ForkTsCheckerWebpackPlugin({
      tsconfig: resolve(__dirname, "tsconfig.json"),
    }),
  ],
};

module.exports = env => {
  const isProduction = env && env.production ? true : false;
  return merge(base, isProduction ? prod : dev);
};
