import './index.css'
import $ from 'jquery'
import { detect } from 'detect-browser'

const detectOldBrowser = () => {
  const browser = detect();
  const browserVersion = parseInt(browser.version);

  $('#browser').text(browser.name)
  $('#version').text(browserVersion)


  if (browser.name === 'safari' || browser.name === 'chrome' || browser.name === 'firefox' || browser.name === 'crios' || browser.name === 'ios' || browser.name === 'fxios') {
    if (browser.name === 'chrome') {
      if (browserVersion < 69) {
        return false;
      }
    }

    if (browser.name === 'safari') {
      if (browserVersion < 12) {
        return false;
      }
    }

    if (browser.name === 'firefox') {
      if (browserVersion < 66) {
        return false;
      }
    }

    if (browser.name === 'crios') {
      if (browserVersion < 69) {
        return false;
      }
    }

    if (browser.name === 'ios') {
      if (browserVersion < 12) {
        return false;
      }
    }

    if (browser.name === 'fxios') {
      if (browserVersion < 66) {
        return false;
      }
    }

    return true;
  }

  return false;
}

export default detectOldBrowser;

