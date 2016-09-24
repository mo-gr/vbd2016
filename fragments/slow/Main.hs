{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty (middleware, scotty, get, html, json, addHeader)
import Control.Monad.IO.Class (liftIO)
import Network.Wai.Middleware.Static (staticPolicy, noDots, (>->), addBase)
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text
import Control.Concurrent (threadDelay)

main :: IO ()
main = scotty 6006 $ do
  middleware $ staticPolicy (noDots >-> addBase "static")
  get "/slow" $ do
    addHeader "Link"
              "<http://localhost:6006/slow.css>; rel=\"stylesheet\""
    liftIO $ threadDelay 2500000
    html $ renderHtml $ do
      H.div H.! A.class_ "slowFragment" $ do
        H.div H.! A.class_ "slow" $ "The Slow Feature™"
  get "/slow-ajax" $ do
    addHeader "Link"
              "<http://localhost:6006/slow.css>; rel=\"stylesheet\""
    addHeader "Link"
              "<http://localhost:6006/slow.js>; rel=\"fragment-script\""
    html $ renderHtml $ do
      H.div H.! A.class_ "slowFragment" $ do
        H.div H.! A.class_ "slow" $ "Loading..."
  get "/api/slow" $ do
    liftIO $ threadDelay 2500000
    json ("The Slow Feature™" :: String)
