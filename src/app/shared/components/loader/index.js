import './index.css'
import $ from 'jquery'

$(window).on('load', function() {
  $('video').on('canplay', function() {
    $('body').removeClass('--loading');

    setTimeout(function() {
      $('.page-loader-wrap').remove();
    }, 2000)
  })
})
