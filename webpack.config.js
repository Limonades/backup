/* global require module process __dirname */
const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const StyleLintPlugin = require('stylelint-webpack-plugin')
const TerserPlugin = require('terser-webpack-plugin')
const OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')

const productionMode = process.env.NODE_ENV === 'production'

const webpackConfig = {

  mode: productionMode ? 'production' :  'development',

  entry: path.join(__dirname, 'src/app/index.js'),

  output: {
    path: path.resolve(__dirname, 'src/public/compiled'),
    filename: '[name].js',
    publicPath: '/compiled/'
  },

  devtool: 'cheap-module-eval-source-map',

  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.js$/,
        exclude: /node_modules|src\/craft\/vendor/,
        use: {
          loader: 'eslint-loader',
          options: {
            emitWarning: true
          }
        }
      },
      {
        test: /\.js$/,
        exclude: /node_modules|src\/craft\/vendor/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        test: /\.css$/,
        use: [
          productionMode ? MiniCssExtractPlugin.loader : 'style-loader',
          {
            loader: 'css-loader',
            options: {
              importLoaders: 1,
              sourceMap: true
            }
          },
          {
            loader: 'postcss-loader',
            options: {
              sourceMap: true
            }
          }
        ]
      },
      {
        test: /\.(jpg|png|gif|svg|woff|ttf|otf|woff2|tiff|webp|jpeg|eot)$/,
        loader: 'file-loader'
      }
    ]
  },

  resolve: {
    modules: [path.resolve(__dirname, 'src/app'), 'node_modules'],
    alias: {
      'TweenLite': 'gsap/src/minified/TweenLite.min.js',
      'TweenMax': 'gsap/src/minified/TweenMax.min.js',
      'TimelineLite': 'gsap/src/minified/TimelineLite.min.js',
      'TimelineMax': 'gsap/src/minified/TimelineMax.min.js',
      'ScrollMagic': 'scrollmagic/scrollmagic/minified/ScrollMagic.min.js'
    }
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(__dirname, 'src/app/layout/skeleton/base-template.twig'),
      filename:  path.join(__dirname, 'src/app/layout/skeleton/base.twig')
    }),
    new CleanWebpackPlugin(['src/public/compiled', 'src/public/service-worker.js']),
  ]
}

if (productionMode) {
  webpackConfig.output.filename = '[name].[chunkhash].js';
  webpackConfig.plugins.push(
    new MiniCssExtractPlugin({
      filename: '[name].[chunkhash].css'
    })
  )
  webpackConfig.plugins.push(
    new StyleLintPlugin({
      files: ['src/app/**/*.css'],
      failOnError: true
    })
  )
  webpackConfig.optimization = {
    minimizer: [
      new TerserPlugin({
        parallel: true
      }),
      new OptimizeCssAssetsPlugin({
        cssProcessorOptions: {
          discardComments: { removeAll: true },
          zindex: false
        }
      })
    ]
  }
} else {
  webpackConfig.plugins.push(
    new MiniCssExtractPlugin({
      filename: '[name].css'
    })
  )
  webpackConfig.plugins.push(
    new StyleLintPlugin({
      files: ['src/app/**/*.css'],
      failOnError: false
    })
  )
}

module.exports = webpackConfig
