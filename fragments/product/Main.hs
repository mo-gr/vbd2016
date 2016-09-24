{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty (middleware, scotty, get, html, addHeader)
import Network.Wai.Middleware.Static (staticPolicy, noDots, (>->), addBase)
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text

main :: IO ()
main = scotty 7000 $ do
  middleware $ staticPolicy (noDots >-> addBase "static")
  get "/duck" $ do
    addHeader "Link"
              "<http://localhost:7000/product.css>; rel=\"stylesheet\""
    html $ renderHtml $ do
      H.img H.! A.alt "Producht picture" H.! A.src "duck.jpg"
      H.button "Buy Now!"
