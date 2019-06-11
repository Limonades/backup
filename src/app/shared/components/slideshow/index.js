import './index.css'
import $ from 'jquery'

$(document).ready(function() {
  const slideshowOpenCLose = ()=> {
    $('.slideshow__item:not(.--first)').toggle();
    $('.slideshow__expand-btn.--open').fadeToggle(600);
    $('.slideshow__expand-btn.--close').toggle();
    $('.slideshow').toggleClass('--expanded');
    $('body').toggleClass('--no-scroll');
    $('.year-container').toggleClass('--no-scroll');
    $('.mobile-logo, .hamburger').toggleClass('--low-z')
  }

  $('.slideshow__expand-btn-wrap').on('click', slideshowOpenCLose);
  $('.slideshow__close-btn-wrap').on('click', slideshowOpenCLose);
})
