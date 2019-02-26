export default class Helper {

  constructor (productionUrl) {
    this.isProductSite = productionUrl === window.location.hostname
  }

  checkUntransformedImage () {
    if (!this.isProductSite) {
        /* eslint-disable */ console.log('%cImage Optimization Check is ON', 'font-size:18px') /* eslint-enable */
      const allElem = document.getElementsByTagName('*')
      let elemArr = [].slice.call(allElem, 0, allElem.length)
      while (elemArr.length) {
        const elem = elemArr.shift()
        const bgImage = elem.style.backgroundImage

        // check backgroundImage attribute
        if (bgImage && /\.jpg|\.png|\.jpeg|\.gif|\.svg|\.webp|\.bmp/.test(bgImage)) {
          let url = /url\(['"]?([^")]+)/.exec(bgImage) || [];
          url = url[1]
          this.checkUrl(url, elem, false)
        }

        // check <img> tag
        if (elem.nodeName === 'IMG') {
          const url = elem.src
          this.checkUrl(url, elem, true)
        }
      }
    }
  }

  checkUrl (url, elem, isImage) {
    if (url) {
      const directory = url.split('/')[3]
      const modes = ['_crop_', '_fit_', '_stretch_']
      if (!(new RegExp(modes.join("|")).test(directory) ||
            url.split('/')[1] === 'imager' ||
            url.split('/')[3] === 'imager' ||
            url.split('/')[3] === 'assets')) {

        /* eslint-disable */ console.log(url) /* eslint-enable */

        const warningImage = 'http://' + window.location.hostname + '/assets/images/warning.png'
        if (isImage) {
          elem.src = warningImage
        } else {
          elem.style.backgroundImage = 'url(' + warningImage + ')'
        }
      }
    }
  }
}
