// module Cycle
const Cycle = require('@cycle/core');

exports.run =
  function(main) {
    return function(drivers) {
      return function() {
        Cycle.run(main, drivers);
      }
    }
  }
