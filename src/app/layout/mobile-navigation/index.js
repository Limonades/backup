import './index.css'
import $ from 'jquery'
import MobileDetect from 'mobile-detect/mobile-detect.min'

const md = new MobileDetect(window.navigator.userAgent);

if (md.mobile()) {
  $('.year').each(function() {
    let id = this.id;
    let title = this.dataset.title;

    $('.mobile-menu__list').append(`<li class="mobile-menu__list-item"><a class="mobile-menu__list-link ${id}" href="#${id}"><span>${id}</span><h3>${title}</h3></a></li>`)
  })

  $(document).ready(function() {

    const mobileMenuToogle = ()=> {
      $('body').toggleClass('--no-scroll');
      $('.mobile-menu').toggleClass('--open');
      $('.hamburger').fadeToggle();
    }

    $('.hamburger').on('click', mobileMenuToogle);
    $('.mobile-menu__close-btn').on('click', mobileMenuToogle);
    $('.mobile-menu__list-link').on('click', mobileMenuToogle);
  })
}
