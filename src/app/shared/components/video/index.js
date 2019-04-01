import './index.css'
import $ from 'jquery'
import MobileDetect from 'mobile-detect/mobile-detect.min'

$(document).ready(function() {
  // no desktop
  const md = new MobileDetect(window.navigator.userAgent);

  if ($('.video__modal').length) {

    if (!md.mobile()) {
      $('.video__play-btn').on('click', function(e) {
        e.preventDefault();
        let a = $(this).attr('href');

        $(a).addClass('--open');
        $('body').addClass('--no-scroll');
        $(this).parents('.video__copy').addClass('--modal-open')
      })

      // close popup
      $('.video__modal').on('click', function(e) {
        if(e.target.tagName !== 'VIDEO'){
          $(this).removeClass('--open');
          $('body').removeClass('--no-scroll');
          $(this).find('.video__copy').removeClass('--modal-open');
        }
      })
    } else {
      $('.video__play-btn').on('click', function(e) {
        e.preventDefault();
        let a = $(this).attr('href');

        $(a).addClass('--open');
        $('body').addClass('--no-scroll');
        $(this).parents('.video').addClass('--modal-open')
      })

      // close popup
      $('.video__modal').on('click', function(e) {
        if(e.target.tagName !== 'VIDEO'){
          $(this).removeClass('--open');
          $('body').removeClass('--no-scroll');
          $(this).parents('.video').removeClass('--modal-open');
        }
      })
    }

    // TODO video controls
    // var video = document.getElementById("video");
    // var playpause = document.getElementById("playpause");
    //
    // function togglePlayPause() {
    //   if (video.paused || video.ended) {
    //     playpause.title = "pause";
    //     playpause.innerHTML = "pause";
    //     video.play();
    //   }
    //   else {
    //     playpause.title = "play";
    //     playpause.innerHTML = "play";
    //     video.pause();
    //   }
    // }
    //
    // function toggleMute() {
    //   video.muted = !video.muted;
    // }
    //
    // function updateProgress() {
    //   var progress = document.getElementById("progress");
    //   var value = 0;
    //   if (video.currentTime > 0) {
    //     value = Math.floor((100 / video.duration) * video.currentTime);
    //   }
    //   progress.style.width = value + "%";
    // }
    //
    // $('#playpause').on('click', function() {
    //   togglePlayPause();
    //   console.log('her')
    // })
    //
    // $('#mute').on('click', function() {
    //   toggleMute();
    //   console.log('hyu')
    // })
    //
    // video.addEventListener("timeupdate", updateProgress, false);
    //
    // video.addEventListener('timeupdate', function() {
    //   $('.current').text(video.currentTime);
    // });
  }
})
