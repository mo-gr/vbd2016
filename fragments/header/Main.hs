{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty (middleware, scotty, get, html, addHeader)
import Network.Wai.Middleware.Static (staticPolicy, noDots, (>->), addBase)
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text

main :: IO ()
main = scotty 5000 $ do
  middleware $ staticPolicy (noDots >-> addBase "static")
  get "/header" $ do
    addHeader "Link"
              "<http://localhost:5000/header.css>; rel=\"stylesheet\""
    html $ renderHtml $ do
      H.h1 "The Best Rubber Duck!"
      H.div H.! A.class_ "navigation" $ do
          H.ul $ do
            H.li $ do H.a H.! A.href "/" $ "Home"
            H.li H.! A.class_ "current" $ do H.a H.! A.href "/duck" $ "Products"
            H.li $ do H.a H.! A.href "/" $ "FAQ"
            H.li $ do H.a H.! A.href "/" $ "Profile"
