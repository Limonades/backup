// import './layout'
// import './pages'
import 'flickity/dist/flickity.min.css'
import './styleguide'
import './numius/global.css'
import './numius/header.css'
import './numius/nav.css'
import './numius/large-title-img-txt.css'
import './numius/title-cards.css'
import './numius/video-banner.css'
import './numius/img-txt-slider.css'
import './numius/video-slider.css'

import Flickity from 'flickity-fade';

new Flickity('.img-txt-slider__slider', {
  fade: true,
  arrowShape: {
    x0: 0,
    x1: 50, y1: 50,
    x2: 50, y2: 45,
    x3: 5
  }
});

new Flickity('.video-slider__slider', {
  fade: true,
  groupCells: true,
  arrowShape: {
    x0: 0,
    x1: 50, y1: 50,
    x2: 50, y2: 45,
    x3: 5
  }
});
