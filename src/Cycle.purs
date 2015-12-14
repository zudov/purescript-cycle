module Cycle where

import Prelude (Unit())

import Control.Monad.Eff (Eff())

foreign import run :: forall inputs outputs eff.
                      ({ | inputs } -> { | outputs }) -> { | inputs } -> Eff eff Unit
