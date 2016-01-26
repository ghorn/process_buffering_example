{-# OPTIONS_GHC -Wall #-}

module Main ( main ) where

import System.IO ( hGetBuffering, stdout )

main :: IO ()
main = hGetBuffering stdout >>= print
