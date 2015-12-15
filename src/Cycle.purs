module Cycle where

import Prelude (Unit())

import Control.Monad.Eff (Eff())

foreign import run :: forall inputs outputs drivers eff.
                      ({ | inputs } -> { | outputs }) -> { | drivers } -> Eff eff Unit
