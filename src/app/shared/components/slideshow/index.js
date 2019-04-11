import './index.css'
import $ from 'jquery'

$(document).ready(function() {
  const slideshowOpenCLose = ()=> {
    $('.slideshow__item:not(.--first)').fadeToggle();
    $('.slideshow__expand-btn').fadeToggle();
    $('.slideshow').toggleClass('--expanded');
    $('body').toggleClass('--no-scroll');
    $('.year-container').toggleClass('--no-scroll');
    $('.mobile-logo, .hamburger').toggleClass('--low-z')
  }

  $('.slideshow__expand-btn-wrap').on('click', slideshowOpenCLose);
  $('.slideshow__close-btn-wrap').on('click', slideshowOpenCLose);
})
