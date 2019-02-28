module.exports =  {
  plugins: [
    require('postcss-smart-import')({
      path: [
        'src/app'
      ]
    }),
    require('postcss-cssnext')
  ]
};
