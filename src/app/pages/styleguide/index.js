import './inedx.css'

import FoldCollection from './FoldCollection'

if (document.querySelector('.style-guide')) {
  new FoldCollection('.category-colors', '.section-colors.collections')
  new FoldCollection('.category-typography', '.section-typography.collections')
  new FoldCollection('.category-buttons', '.section-buttons.collections')
  new FoldCollection('.category-icons', '.section-icons.collections')
}
