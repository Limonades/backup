import './index.css'
import $ from 'jquery'
import MobileDetect from 'mobile-detect/mobile-detect.min'

const md = new MobileDetect(window.navigator.userAgent);

if (!md.mobile()) {
  $('.year').each(function() {
    let id = this.id;
    let title = this.dataset.title;

    $('.nav__list').append(`<li class="nav__list-item"><a class="nav__list-link ${id}" href="#${id}"><span>${id}</span><p class="nav__title">${title}</p></a></li>`)
  })
}
