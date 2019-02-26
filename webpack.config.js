const webpack = require('webpack')
const path = require('path')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const StyleLintPlugin = require('stylelint-webpack-plugin')
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const SWPrecacheWebpackPlugin = require('sw-precache-webpack-plugin')
const WebpackShellPlugin = require('webpack-shell-plugin')

const webpackConfig = {

  entry: {
    app: path.join(__dirname, 'src/app/index.js')
  },

  output: {
    path: path.join(__dirname, 'src/public/compiled'),
    publicPath: '/compiled/',
    filename: '[name].js'
  },

  devtool: 'cheap-module-eval-source-map',

  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.js$/,
        loader: 'eslint-loader',
        exclude: /node_modules/
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: ['es2015']
        }
      },
      { test: /\.js$/,
        loader: 'imports-loader?define=>false'
      },
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          loader: [
            'css-loader?sourcemap&importLoaders=1',
            'postcss-loader'
          ]
        })
      },
      {
        test: /\.(jpg|png|gif|svg|woff|ttf|otf|woff2|tiff|webp|jpeg|eot)$/,
        loader: 'file-loader'
      }
    ]
  },

  resolve: {
    // alias: {
    //   config: 'src/assets/js/config',
    //   js: 'src/assets/js'
    // },
    modules: [
      'node_modules',
      path.resolve(__dirname, 'src/app')
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(__dirname, 'src/app/layout/skeleton/base-template.twig'),
      filename: path.join(__dirname, 'src/app/layout/skeleton/base.twig')
    })
  ]
}

if (process.env.NODE_ENV === 'production') {
  webpackConfig.output.filename = '[name].[chunkhash].js'
  webpackConfig.plugins.push(
    new StyleLintPlugin({
      files: ['src/app/**/*.css'],
      failOnError: true,
      configBasedir: __dirname
    })
  )
  webpackConfig.plugins.push(
    new ExtractTextPlugin({
      filename: '[name].[chunkhash].css'
    })
  )
  webpackConfig.plugins.push(
    new webpack.optimize.UglifyJsPlugin({
      comments: false
    })
  )
  webpackConfig.plugins.push(
    new OptimizeCssAssetsPlugin({
      cssProcessorOptions: {
        discardComments: { removeAll: true },
        zindex: false
      }
    })
  )
} else {
  webpackConfig.plugins.push(
    new ExtractTextPlugin({
      filename: '[name].css'
    })
  )
  webpackConfig.plugins.push(
    new StyleLintPlugin({
      files: ['src/app/**/*.css'],
      failOnError: false,
      configBasedir: __dirname
    })
  )
}

module.exports = webpackConfig
