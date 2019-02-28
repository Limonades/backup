import './index.css'
import TweenLite from 'gsap/TweenLite'
import 'gsap/ScrollToPlugin'
import ScrollMagic from 'ScrollMagic'
import 'ScrollMagic/scrollmagic/minified/plugins/animation.gsap.min.js'
import 'ScrollMagic/scrollmagic/minified/plugins/debug.addIndicators.min.js'

if (document.querySelector('.homepage')) {
  let scrollTimer
  const controller = new ScrollMagic.Controller()
  const viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight || 0)
  const halfViewHeight = viewHeight / 2

  // window.addEventListener('scroll', () => console.log(viewHeight, window.scrollY || window.scrollTop || document.getElementsByTagName('html')[0].scrollTop))

  window.addEventListener('wheel', e => {
    throttle(() => {
      const delta = Math.sign(e.deltaY)
      const currentHeight = window.scrollY || window.scrollTop || document.getElementsByTagName('html')[0].scrollTop
      const currentPage = Math.round(currentHeight / viewHeight)
      const nextPage = delta > 0 ? currentPage + 1 : currentPage - 1
      const scrollInCurrentPage = delta > 0 ? currentHeight % viewHeight : viewHeight - (currentHeight % viewHeight)
      // console.log('view height: ', viewHeight)
      // console.log('current height: ', currentHeight)
      // console.log('delta', delta)
      // console.log( delta > 0 ? currentHeight % viewHeight : viewHeight - (currentHeight % viewHeight))
      if (scrollInCurrentPage < 300) {
        TweenLite.to(window, 2, { scrollTo: currentPage * viewHeight })
      } else {
        TweenLite.to(window, 2, { scrollTo: nextPage * viewHeight })
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

  // // page 2 Image 1
  new ScrollMagic.Scene({
    triggerElement: '#page1',
    offset: halfViewHeight,
    duration: halfViewHeight
  })
    .setTween('.page2-image1', 0.5, { y: -halfViewHeight, opacity: 1 })
    .addIndicators({ name: 'page2-image1' })
    .addTo(controller)

  new ScrollMagic.Scene({
    triggerElement: '#page2',
    duration: halfViewHeight + 1
  })
    .setPin('.page2-image1', {pushFollowers: false})
    .addIndicators({ name: 'page2-image1-pin' })
    .addTo(controller);

  // Page 2 Copy
  const testAnimation = new TweenLite('.page2-copy', 1, { y: -100, opacity: 1 })
  new ScrollMagic.Scene({
    triggerElement: '#page2',
    offset: 250,
    duration: halfViewHeight - 250
  })
    .setTween(testAnimation)
    .addIndicators({ name: 'page2-copy' })
    .addTo(controller);

  [...document.querySelectorAll('.page2-pin')].forEach(element => {
    new ScrollMagic.Scene({
      triggerElement: '#page2',
      offset: halfViewHeight
    })
      .addIndicators({ name: 'page2-pin' })
      .setPin(element)
      .addTo(controller)
  })

  // Page 2 Image 2
  new ScrollMagic.Scene({
    triggerElement: '#page2',
    offset: halfViewHeight
  })
    .setTween('.page2-image2', 1, { opacity: 1, backgroundPositionY: '10%' })
    .addIndicators({ name: 'page2-image2' })
    .addTo(controller)
}
