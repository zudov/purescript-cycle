// module Cycle.Dom
const CycleDOM = require('@cycle/dom')

exports.makeDomDriver = CycleDOM.makeDOMDriver

exports.select =
  function(selector) {
    return function(driver) {
      return driver.select(selector);
    }
  }

exports.events =
  function(eventType) {
    return function(elements) {
      return elements.events(eventType);
    }
  }
