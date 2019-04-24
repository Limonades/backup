import './index.css'
import { detect } from 'detect-browser'

const detectOldBrowser = () => {
  const browser = detect();
  const browserVersion = parseInt(browser.version);

  if (browser.name === 'safari' || browser.name === 'chrome' || browser.name === 'firefox') {
    if (browser.name === 'chrome') {
      if (browserVersion < 69) {
        return false;
      }
    }

    if (browser.name === 'safari') {
      if (browserVersion < 11) {
        return false;
      }
    }

    if (browser.name === 'firefox') {
      if (browserVersion < 66) {
        return false;
      }
    }

    return true;
  }

  return false;
}

export default detectOldBrowser;

