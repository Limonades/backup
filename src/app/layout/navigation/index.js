import './index.css'
import $ from 'jquery'

$('.year').each(function() {
  let id = this.id;

  $('.nav__list').append(`<li class="nav__list-item"><a class="nav__list-link" href="#${id}">${id}</a></li>`)
})
