/* global module process */

module.exports =  {
  plugins: {
    'postcss-import': {
      path: ['src/app']
    },
    'postcss-preset-env': {
      stage: 1,
      features: {
        'nesting-rules': true
      }
    },
    'cssnano': process.env.NODE_ENV === 'production' ? {} : false
  }
}
