module Main where

import Happstack.Server (nullConf, Conf(..), simpleHTTP, toResponse, ok)

main :: IO ()
main =
    let conf = nullConf { port = 8001 }
    in  simpleHTTP conf $ ok "Hello, World! (from 2)"