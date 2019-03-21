import './index.css'
import $ from 'jquery'

$(document).ready(function() {
  const slideshowOpenCLose = ()=> {
    $('.slideshow__item:not(.--first)').fadeToggle();
    $('.slideshow__expand-btn').fadeToggle();
    $('.slideshow').toggleClass('--expanded');
  }

  $('.slideshow__expand-btn-wrap').on('click', slideshowOpenCLose);
  $('.slideshow__close-btn-wrap').on('click', slideshowOpenCLose);
})
