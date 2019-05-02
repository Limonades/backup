import './index.css'
import $ from 'jquery'

$(document).ready(function() {
  setTimeout(function() {
    $('body').removeClass('--loading');
  }, 4000)

  setTimeout(function() {
    $('.page-loader-wrap').remove();
  }, 6000)
})
