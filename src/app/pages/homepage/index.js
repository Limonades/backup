import './index.css'
import $ from 'jquery'
import TweenLite from 'gsap/TweenLite'
import 'gsap/ScrollToPlugin'
import ScrollMagic from 'scrollmagic'
import 'scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators'
import 'scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap'
import MobileDetect from 'mobile-detect/mobile-detect.min'

// TODO REFACTORING
if (document.querySelector('.homepage')) {
  let scrollTimer
  const controller = new ScrollMagic.Controller()
  const viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
  const halfViewHeight = viewHeight / 2
  let activeCoord;
  let lineWidth;

  const md = new MobileDetect(window.navigator.userAgent);

  if (!md.mobile()) {
    const moveNavProgress = () => {
      activeCoord = $('.nav__list-link.--active').position();
      lineWidth = $('.nav__list-link.--active').width() / 2;

      $('.nav__progress-bar').css({
        'width': `${activeCoord.left + lineWidth}px`
      })
    }

    $(document).ready(function() {
      moveNavProgress();
    })

    $('.nav__list-link').on('mouseenter', function() {
      activeCoord = $(this).position();
      lineWidth = $(this).width() / 2;

      $('.nav__progress-bar').css({
        'width': `${activeCoord.left + lineWidth}px`
      })
    })

    $('.nav').on('mouseleave', moveNavProgress);

      // controller.scrollTo(function(newpos) {
    //   console.log(newpos)
    //   TweenLite.to(window, 0.5, {scrollTo: {y: newpos}})
    // })

    $(document).on('click', '.nav__list-link', function(e) {
      const id = $(this).attr("href");
      const offsetTop = id === "#" ? 0 : $(id).offset().top + 1;

      // $('html, body').stop().animate({
      //   scrollTop: offsetTop,
      // }, 500);

      e.preventDefault();

      if (id.length > 0) {
        e.preventDefault();

        controller.scrollTo(offsetTop);

        // console.log(id)

        if (window.history && window.history.pushState) {
          history.pushState("", document.title, id)
        }

        setTimeout(function() {
          moveNavProgress();
        }, 100);
      }
    })

    // $('.nav__item-link').each(function() {
    //   new ScrollMagic.Scene({
    //     triggerElement: this,
    //   })
    //     .setTween($(this), 1, {autoAlpha: 0, scale: 0.7})
    //     .addTo(controller)
    // })

    // window.addEventListener('scroll', () => console.log(viewHeight, window.scrollY || window.scrollTop || document.getElementsByTagName('html')[0].scrollTop))

    window.addEventListener('wheel', e => {
      throttle(() => {
        const delta = Math.sign(e.deltaY)
        const currentHeight = window.scrollY || window.scrollTop || document.getElementsByTagName('html')[0].scrollTop
        const currentPage = Math.round(currentHeight / viewHeight)
        // const nextPage = delta > 0 ? currentPage + 1 : currentPage - 1
        const scrollInCurrentPage = delta > 0 ? currentHeight % viewHeight : viewHeight - (currentHeight % viewHeight)
        // console.log('view height: ', viewHeight)
        // console.log('current height: ', currentHeight)
        // console.log('delta', delta)
        // console.log('currentPage', currentPage)
        // console.log('nextPage', nextPage)
        // console.log('scrollInCurrentPage', scrollInCurrentPage)
        if (scrollInCurrentPage < 300) {
          TweenLite.to(window, 1, { scrollTo: currentPage * viewHeight })
        } else {
          TweenLite.to(window, .5, { scrollTo: currentPage * viewHeight })
          moveNavProgress();
        }
      })
    })

    const throttle = callback => {
      const minScrollTime = 600
      if (!scrollTimer) {
        scrollTimer = setTimeout(function () {
          scrollTimer = null
          callback()
        }, minScrollTime)
      }
    }

    $('.header').each(function() {
      // page 3 Image 1
      new ScrollMagic.Scene({
        triggerElement: this,
        // offset: -halfViewHeight,
        // duration: viewHeight + halfViewHeight
      })
        .setTween($(this).find('.header__year-photo'), 0.6, { top: 3 + 'rem' })
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight
      })
        .setPin($(this).find('.header__title-wrap')[0])
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight
      })
        .setPin($(this).find('.header__year-title')[0], {pushFollowers: 0})
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: 0,
        duration: halfViewHeight,
      })
        .setTween($(this).find('.header__title-wrap'), 1, { opacity: 1, backgroundPositionY: '50%' })
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: viewHeight,
        duration: halfViewHeight,
      })
        .setTween($(this).find('.header__title-wrap'), 1, { opacity: 0, backgroundPositionY: '0' })
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 2,
        duration: halfViewHeight + halfViewHeight / 2
      })
        .setClassToggle($(this).find('.header__title')[0], 'fade-in')
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 2,
        duration: halfViewHeight + halfViewHeight / 2
      })
        .setClassToggle($(this).find('.header__year-title')[0], 'fade-in')
        .addTo(controller)
    })

    $('.detail').each(function() {
      // console.log($(this))
      // page 3 Image 1
      new ScrollMagic.Scene({
        triggerElement: this,
        // offset: halfViewHeight,
        duration: halfViewHeight

      })
        .setTween($(this).find('.detail__photo'), .6, { top: 3 + 'rem' })
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 4,
        duration: halfViewHeight + halfViewHeight / 4
      })
        .setClassToggle($(this).find('.section-header')[0], 'fade-in')
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        // offset: viewHeight,
        // duration: halfViewHeight
      })
        .setTween($(this).find('.detail__img-bg'), .5, {  opacity: 1, top: 0 })
        // .addIndicators({ name: '.detail__img-bg' })
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 4,
        duration: halfViewHeight + halfViewHeight / 4
      })
        .setClassToggle($(this).find('.detail__photo-description h3')[0], 'fade-in')
        // .addIndicators({name: 'fade-in'})
        .addTo(controller)

      // page 3 txt 2
      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 4,
        duration: halfViewHeight + halfViewHeight / 4
      })
        .setClassToggle($(this).find('.detail__txt-description')[0], 'fade-in')
        // .addIndicators({ name: '.detail__txt-description' })
        .addTo(controller)

      // TODO text
      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight + (halfViewHeight / 2)
      })
        .setPin($(this).find('.section-header')[0], {pushFollowers: 0})
        // .addIndicators({name: 'PIDARASSSSSSSSSS'})
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight
      })
        .setPin($(this).find('.detail__bg')[0], {pushFollowers: 0})
        // .addIndicators({name: 'background', indent: 100, color: 'yellow'})
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight
      })
        .setClassToggle($(this).find('.detail__bg')[0], 'fade-in')
        // .addIndicators({name: 'PIDARASSSSSSSSSS'})
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight
      })
        .setPin($(this).find('.detail__txt-description')[0])
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight,
        duration: viewHeight
      })
        .setPin($(this).find('.detail__photo-description h3')[0])
        // .addIndicators()
        .addTo(controller)
      //
    })

    $('.video').each(function() {
      // page 4 bg
      new ScrollMagic.Scene({
        triggerElement: this,
      })
        .setTween( $(this).find('.video__content'), 1, {  opacity: 1, left: 0 })
        // .addIndicators()
        .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 2,
        duration: halfViewHeight + halfViewHeight / 2
      })
        .setClassToggle($(this).find('.section-header')[0], 'fade-in')
        .addTo(controller)

      new ScrollMagic.Scene({
        offset: halfViewHeight,
        triggerElement: this
      })
        .setTween($(this).find('.video__img-bg'), .5, {  opacity: 1, bottom: 0 })
        // .addIndicators({ name: '.detail__txt-description' })
        .addTo(controller)
    })

    $('.slideshow').each(function() {
      new ScrollMagic.Scene({
          triggerElement: this,
        })
          .addTo(controller)

      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight - halfViewHeight / 2,
        duration: halfViewHeight
      })
        .setClassToggle($(this).find('.section-header')[0], 'fade-in')
        .addTo(controller)

        new ScrollMagic.Scene({
          triggerElement: this,
        })
          .setTween($(this).find('.slideshow__item.--animated img'), 1, { opacity: 1, objectPosition: 0 })
          .addTo(controller)

        new ScrollMagic.Scene({
          triggerElement: this,
        })
          .setTween($(this).find('.slideshow__item.--first')[0], 1, { bottom : 0 })
          // .addIndicators({ name: '.detail__txt-description' })
          .addTo(controller)
    })

    $('.year').each(function() {
      new ScrollMagic.Scene({
        triggerElement: this,
        duration: this.clientHeight
      })
        .setClassToggle($(`.nav__list-link.${this.id}`)[0], '--active')
        // .addIndicators()
        // // .add(moveNavProgress())
        .addTo(controller)
    })
    // document.querySelectorAll('.detail').forEach((e, i) => {
    //   console.log(e)
    //   // page 3 Image 1
    //   new ScrollMagic.Scene({
    //     triggerElement: e,
    //   })
    //     .setTween(`.detail__photo`, .6, { top: 3 + 'rem' })
    //     .addIndicators({ name: '.detail__photo' })
    //     .addTo(controller)
    //
    //   new ScrollMagic.Scene({
    //       triggerElement: e,
    //     })
    //       .setTween('.detail__img-bg', .5, {  opacity: 1, top: 0 })
    //       .addIndicators({ name: '.detail__img-bg' })
    //       .addTo(controller)
    // })

    // // page 2 Image 1
    // new ScrollMagic.Scene({
    //   triggerElement: '#page1',
    //   offset: halfViewHeight,
    //   duration: halfViewHeight
    // })
    //   .setTween('.page2-image1', 0.5, { y: -halfViewHeight, opacity: 1 })
    //   .addIndicators({ name: 'page2-image1' })
    //   .addTo(controller)
    //
    // new ScrollMagic.Scene({
    //   triggerElement: '#page2',
    //   duration: halfViewHeight,
    // })
    //   .setPin('.page2-image1')
    //   .addIndicators({ name: 'page2-image1-pin' })
    //   .addTo(controller);
    //
    // // Page 2 Image 2
    // new ScrollMagic.Scene({
    //   triggerElement: '#page2',
    //   offset: halfViewHeight
    // })
    //   .setTween('.page2-image2', 1, { opacity: 1, backgroundPositionY: '10%' })
    //   .addIndicators({ name: 'page2-image2' })
    //   .addTo(controller);
    //
    // // Page 2 Copy
    // new ScrollMagic.Scene({
    //   triggerElement: '#page2',
    //   offset: 250,
    //   duration: halfViewHeight - 250
    // })
    //   .setTween('.page2-copy', 1, { opacity: 1, y: -100 })
    //   .addIndicators({ name: 'page2-copy' })
    //   .addTo(controller);
    //
    // [...document.querySelectorAll('.page2-pin')].forEach(element => {
    //   new ScrollMagic.Scene({
    //     triggerElement: '#page2',
    //     offset: halfViewHeight,
    //   })
    //     .setPin(element)
    //     .addIndicators({ name: 'page2-pin' })
    //     .addTo(controller)
    // });
    //
    // // // TODO debug - need to return original position
    // [...document.querySelectorAll('.page2-pin')].forEach(element => {
    //   new ScrollMagic.Scene({
    //     triggerElement: '#page2',
    //     offset: halfViewHeight * 1.5,
    //   })
    //     .setTween(element, 2, { opacity: 0 })
    //     .addIndicators({ name: 'page2-pin' })
    //     .removePin(element)
    //     .addTo(controller)
    // })
    //
    // // page 3 Image 1
    // new ScrollMagic.Scene({
    //   triggerElement: '#page2',
    //   offset: viewHeight,
    // })
    //   .setTween('.detail__photo', .6, { top: 3 + 'rem' })
    //   .addIndicators({ name: '.detail__photo' })
    //   .addTo(controller)
    //
    // new ScrollMagic.Scene({
    //   triggerElement: '#page3',
    //   duration: viewHeight,
    // })
    //   .addIndicators({ name: '.detail__photo' })
    //   .addTo(controller)
    //
    // // page 3 Image 2
    // new ScrollMagic.Scene({
    //   triggerElement: '#page3',
    //   offset: 250,
    // })
    //   .setTween('.detail__img-bg', .5, {  opacity: 1, top: 0 })
    //   .addIndicators({ name: '.detail__img-bg' })
    //   .addTo(controller)
    //
    // // page 3 txt 1
    // new ScrollMagic.Scene({
    //   triggerElement: '#page3',
    //   offset: halfViewHeight - (halfViewHeight / 2),
    // })
    //   .setTween('.detail__photo-description h3', 1, {  opacity: 1 })
    //   .addIndicators({ name: '.detail__photo-description h3' })
    //   .addTo(controller)
    //
    // // page 3 txt 2
    // new ScrollMagic.Scene({
    //   triggerElement: '#page3',
    //   offset: halfViewHeight - (halfViewHeight / 2),
    // })
    //   .setTween('.detail__txt-description', 1, {  opacity: 1 })
    //   .addIndicators({ name: '.detail__txt-description' })
    //   .addTo(controller)
    //
    // // page 4 bg
    // new ScrollMagic.Scene({
    //   triggerElement: '#page4',
    // })
    //   .setTween('.video__content', 1, {  opacity: 1, left: 0 })
    //   .addIndicators({ name: '.detail__txt-description' })
    //   .addTo(controller)
    //
    // new ScrollMagic.Scene({
    //   triggerElement: '#page4',
    // })
    //   .setTween('.video__img-bg ', .5, {  opacity: 1, bottom: 0 })
    //   .addIndicators({ name: '.detail__txt-description' })
    //   .addTo(controller)
    //
    // new ScrollMagic.Scene({
    //   triggerElement: '#page5',
    // })
    //   .addTo(controller)
    //
    // new ScrollMagic.Scene({
    //   triggerElement: '#page5',
    // })
    //   .setTween('.slideshow__item.--animated img', 1, { opacity: 1, objectPosition: 0 })
    //   .addIndicators({ name: '.detail__txt-description' })
    //   .addTo(controller)
    //
    // new ScrollMagic.Scene({
    //   triggerElement: '#page5',
    // })
    //   .setTween('.slideshow__item.--first', 1, { bottom : 0 })
    //   .addIndicators({ name: '.detail__txt-description' })
    //   .addTo(controller)
  } else {
    $('.nav').addClass('--mobile');
    $('progress').addClass('--mobile');
    $('.header').addClass('--mobile');
    $('.detail').addClass('--mobile');
    $('.video').addClass('--mobile');
    $('.slideshow').addClass('--mobile');

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

    let scrollTimer
    const controller = new ScrollMagic.Controller()
    const viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
    // const halfViewHeight = viewHeight / 2

    window.addEventListener('scroll', e => {
      throttle(() => {
        const delta = Math.sign(e.deltaY)
        const currentHeight = window.scrollY || window.scrollTop || document.getElementsByTagName('html')[0].scrollTop
        const currentPage = Math.round(currentHeight / viewHeight)
        // const nextPage = delta > 0 ? currentPage + 1 : currentPage - 1
        const scrollInCurrentPage = delta > 0 ? currentHeight % viewHeight : viewHeight - (currentHeight % viewHeight)
        // console.log('view height: ', viewHeight)
        // console.log('current height: ', currentHeight)
        // console.log('delta', delta)
        // console.log('currentPage', currentPage)
        // console.log('nextPage', nextPage)
        // console.log('scrollInCurrentPage', scrollInCurrentPage)
        if (scrollInCurrentPage < 30) {
          TweenLite.to(window, .2, { scrollTo: currentPage * viewHeight })
        } else {
          TweenLite.to(window, .2, { scrollTo: currentPage * viewHeight })
        }
      })
    })

    const throttle = callback => {
      const minScrollTime = 600
      if (!scrollTimer) {
        scrollTimer = setTimeout(function () {
          scrollTimer = null
          callback()
        }, minScrollTime)
      }
    }

    $('.header').each(function() {
      // page 3 Image 1
      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight / 2,
        duration: $(this).height()
      })
        .setClassToggle(this, '--fixed')
        // .addIndicators()
        .addTo(controller)
    })

    $('.detail').each(function() {
      // page 3 Image 1
      new ScrollMagic.Scene({
        triggerElement: this,
        offset: halfViewHeight / 2,
        duration: $(this).height()
      })
        .setClassToggle(this, '--fixed')
        // .addIndicators()
        .addTo(controller)
    })
  }
}

