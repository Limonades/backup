import './index.css'
import $ from 'jquery'
import scrollSnapPolyfill from 'css-scroll-snap-polyfill'

$(window).on('load', function() {
  // $('video').on('canplay', function() {
    $('body').removeClass('--loading');

  scrollSnapPolyfill();

  setTimeout(function() {
      $('.page-loader-wrap').remove();
    }, 2000)
  // })
})
