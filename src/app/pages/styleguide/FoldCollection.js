/**
 * FoldCollection
 *
 * @para [string] categorySelector     css selector for the section title
 * @para [string] collectionSelector   css selector for collection container
 *
 */

class FoldCollection {
  constructor (categorySelector, collectionSelector) {
    this.category = document.querySelector(categorySelector)
    this.collection = document.querySelector(collectionSelector)

    if (this.category && this.collection) {
      this.init()
    } else {
      throw Error('styleguide fold collectionhandler can\'t be found')
    }
  }

  init () {
    const originalHeight = this.collection.clientHeight
    this.collection.style.height = '0px'
    this.collection.style.height = originalHeight + 'px'

    this.category.addEventListener('click', () => {
      const targetHeight = this.collection.clientHeight === originalHeight ? 0 : originalHeight
      this.collection.style.height = targetHeight + 'px'
      this.collection.style.opacity = targetHeight
    })
  }
}

export default FoldCollection
