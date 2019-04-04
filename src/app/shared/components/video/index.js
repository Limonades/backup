import './index.css'
import $ from 'jquery'
import MobileDetect from 'mobile-detect/mobile-detect.min'

$(document).ready(function() {
  const mute = document.getElementById("mute");

  function togglePlayPause() {
    if (video.paused || video.ended) {
      playpause.title = "pause";
      video.play();
    }
    else {
      playpause.title = "play";
      video.pause();
    }
    $(playpause).children().toggleClass('video__btn-img--hide');
  }

  function toggleMute() {
    video.muted = !video.muted;
    $(mute).children().toggleClass('video__btn-img--hide');
  }
  // no desktop
  const md = new MobileDetect(window.navigator.userAgent);

  if ($('.video__modal').length) {

    if (!md.mobile()) {
      $('.video__play-btn').on('click', function(e) {
        e.preventDefault();
        let id = $(this).attr('href');

        $(`#${id} video`)[0].play();

        $(`#${id}`).addClass('--open');
        $('body').addClass('--no-scroll');
        $(this).parents('.video__copy').addClass('--modal-open')
      });

      // close popup
      $('.video__modal').on('click', function(e) {
        if(e.target.tagName !== 'VIDEO' && !$(e.target).hasClass('video__btn') ){
          $(this).removeClass('--open');
          $('body').removeClass('--no-scroll');
          $(this).find('.video__copy').removeClass('--modal-open');
          $(`.video__modal video`)[0].pause();
          // $(playpause).children().toggleClass('video__btn-img--hide');
        }
      })
    } else {
      $('.video__play-btn').on('click', function(e) {
        e.preventDefault();
        let id = $(this).attr('href');

        $(`#${id}`).addClass('--open');
        $('body').addClass('--no-scroll');
        $(this).parents('.video').addClass('--modal-open');
      });

      // close popup
      $('.video__modal').on('click', function(e) {
        if(e.target.tagName !== 'VIDEO' && !$(e.target).hasClass('video__btn') ){
          $(this).removeClass('--open');
          $('body').removeClass('--no-scroll');
          $(this).parents('.video').removeClass('--modal-open');
          // $(playpause).children().toggleClass('video__btn-img--hide');
        }
      })
    }

    // TODO video controls
    var video = document.getElementById("video");
    var playpause = document.getElementById("playpause");


    // function updateProgress() {
    //   var progress = document.getElementById("progress");
    //   var value = 0;
    //   if (video.currentTime > 0) {
    //     value = Math.floor((100 / video.duration) * video.currentTime);
    //   }
    //   progress.style.width = value + "%";
    // }

    $('#playpause').on('click', function() {
      togglePlayPause();
    });

    $('#mute').on('click', function() {
      toggleMute();
    });

  }
  $(video).on('ended', function () {
    $(playpause).children().toggleClass('video__btn-img--hide');
  });

  $(video).on('timeupdate', function() {

    setTimeout(function () {
      let minutes;
      let seconds;
      const time = Math.floor(video.currentTime );
      if (+time > 59 ) {
        minutes = parseInt( (time/60)+'');
        seconds = (time%60) ? time % 60 : '00';
        +seconds < 10 ? seconds = '0'+ seconds : seconds;
        // +minutes < 10 ? minutes = '0'+ minutes : minutes;
      } else {
         minutes = '0';
         seconds = time;
         +seconds < 10 ? seconds = '0'+ seconds : seconds;
      }
      $('.current').html(minutes + ':' + seconds);
    }, 1000);

  });

//update HTML5 video current play time
  $(video).on('timeupdate', function() {
    var currentPos = video.currentTime; //Get current time
    var maxduration = video.duration; //Get video duration
    var percentage = 100 * currentPos / maxduration + "%"; //in %
    $('.timeBar').css({'width' : percentage });

  });

  var timeDrag = false;   /* Drag status */
  $('.progressBar').mousedown(function(e) {
    timeDrag = true;
    updatebar(e.pageX);
  });
  $(document).mouseup(function(e) {
    if(timeDrag) {
      timeDrag = false;
      updatebar(e.pageX);
    }
  });
  $(document).mousemove(function(e) {
    if(timeDrag) {
      updatebar(e.pageX);
    }
  });

//update Progress Bar control
  var updatebar = function(x) {
    var progress = $('.progressBar');
    var maxduration = video.duration; //Video duraiton
    var position = x - progress.offset().left; //Click pos
    var percentage = 100 * position / progress.width();

    //Check within range
    if(percentage > 100) {
      percentage = 100;
    }
    if(percentage < 0) {
      percentage = 0;
    }

    //Update progress bar and video currenttime
    $('.timeBar').css('width', percentage+'%');
    video.currentTime = maxduration * percentage / 100;
  };

});
