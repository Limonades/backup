import './index.css'
import $ from 'jquery'

$(document).ready(function() {
  const $firstVideo = document.querySelector('video');
  $($firstVideo)[0].play();

  if ($firstVideo) {
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
