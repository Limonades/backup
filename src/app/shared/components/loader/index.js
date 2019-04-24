import './index.css'
import $ from 'jquery'

$(window).on('load', function() {
  $('body').removeClass('--loading');

  setTimeout(function() {
    $('.page-loader-wrap').remove();
  }, 2000)
})
