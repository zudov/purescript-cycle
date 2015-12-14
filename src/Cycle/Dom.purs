module Cycle.Dom where

import Prelude hiding (div)

import Data.Void (Void())
import Data.Identity (Identity(), runIdentity)

import DOM.Event.Types (Event())
import Rx.Observable (Observable())

import Halogen.Internal.VirtualDOM (VTree())
import Halogen.HTML.Core (HTML())
import Halogen.HTML.Renderer.VirtualDOM as Renderer

type CycleHTML = HTML Void (Identity Unit)

renderHTML :: CycleHTML -> VTree
renderHTML = Renderer.renderHTML (pure <<< runIdentity)

foreign import data DomDriver :: *

foreign import makeDomDriver :: String -> DomDriver

foreign import data Selection :: *

foreign import select :: String -> DomDriver -> Selection
foreign import events :: String -> Selection -> Observable Event
