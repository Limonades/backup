import './index.css'
import $ from 'jquery'

$('.year').each(function() {
  let id = this.id;
  let title = this.dataset.title;

  $('.nav__list').append(`<li class="nav__list-item"><a class="nav__list-link ${id}" href="#${id}"><span>${id}</span><p class="nav__title">${title}</p></a></li>`)
})
