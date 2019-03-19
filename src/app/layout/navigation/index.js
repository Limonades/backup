import './index.css'
import $ from 'jquery'

$('.year').each(function() {
  let id = this.id;

  $('.nav__list').append(`<li class="nav__list-item"><a class="nav__list-link ${id}" href="#${id}">${id}</a></li>`)
})

$(document).ready(function() {

  var getMax = function() {
    return $(document).height() - $(window).height();
  }

  var getValue = function() {
    return $(window).scrollTop();
  }

  if ('max' in document.createElement('progress')) {
    var progressBar = $('progress');

    progressBar.attr({
      max: getMax()
    });

    progressBar.attr({
      value: getValue()
    });

    $(document).on('scroll', function() {
      progressBar.attr({
        value: getValue()
      });
    });

    $(window).resize(function() {

      progressBar.attr({
        max: getMax(),
        value: getValue()
      });
    });

  } else {

    var max = getMax(),
      value, width;

    var getWidth = function() {

      value = getValue();
      width = (value / max) * 100;
      width = width + '%';
      return width;
    }

    var setWidth = function() {
      progressBar.css({
        width: getWidth()
      });
    }

    $(document).on('scroll', setWidth);
    $(window).on('resize', function() {

      max = getMax();
      setWidth();
    });
  }
});
