import './index.css'
import $ from 'jquery'

$(document).ready(function() {
  const $firstVideo = document.querySelector('video');

  if ($firstVideo && !$('.old-b').hasClass('--show')) {
    $($firstVideo)[0].play();

    $firstVideo.addEventListener('timeupdate', function() {
      $('body').removeClass('--loading');

      setTimeout(function() {
        $('.page-loader-wrap').remove();
      }, 2000)
    }, {once: true})

    return;
  }

  $('body').removeClass('--loading');

  setTimeout(function() {
    $('.page-loader-wrap').remove();
  }, 2000)
})
