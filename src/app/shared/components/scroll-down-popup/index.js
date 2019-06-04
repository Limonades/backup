import './index.css'
import $ from 'jquery'

$('document').ready(function() {
  // scroll down popup
  $('.header__scroll-btn-wrap').on('click', function() {
    const nextSlide = $('#top').siblings('.year').attr('id');

    // start animation
    $('.scroll-popup').fadeIn().addClass('--show-content');

    // end animation
    setTimeout(function() {
      $('.scroll-popup').fadeIn().addClass('--hide-content');

      // change screen
      window.location.href = `#${nextSlide}`;
    }, 1500)

    // to initial state
    setTimeout(function() {
      $('.scroll-popup').hide().removeClass('--hide-content --show-content');
    }, 3000)
  })
})
