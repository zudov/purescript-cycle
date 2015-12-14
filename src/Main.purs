module Main where

import Prelude

import Cycle
import Cycle.Dom
import Rx.Observable

import Halogen.HTML as H
import Halogen.HTML.Properties as P

import Halogen.Internal.VirtualDOM (VTree())

main = run app drivers

app :: { dom :: DomDriver } -> { dom :: Observable VTree }
app requests = { dom: map (renderHTML <<< render) count }
  where
    clicks = requests.dom # select "#count" # events "click"
    count  = clicks # map (const 1)
                    # startWith 0
                    # scan (+) 0
    render state = H.div_
                     [ H.button
                        [ P.id_  "count" ]
                        [ H.text "Click me" ]
                     , H.div_
                        [ H.text (show state) ]
                     ]

drivers :: { dom :: DomDriver }
drivers = { dom: makeDomDriver "#app" }
