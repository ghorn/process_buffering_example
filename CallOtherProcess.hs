{-# OPTIONS_GHC -Wall #-}

module Main ( main ) where

import Control.Monad ( void )
import System.IO ( IOMode(..), BufferMode(..), hSetBuffering, withFile )
import qualified System.Process as P

main :: IO ()
main = do
  callWithInherit
  callWithLog

callWithInherit :: IO ()
callWithInherit = do
    let p = P.proc "./print_stdout_buffering" []
    putStrLn "calling with inherited stdout..."
    (_, _, _, h) <- P.createProcess p
    void $ P.waitForProcess h

callWithLog :: IO ()
callWithLog = do
  let logfile = "test.log"
  withFile logfile WriteMode $ \logHandle -> do
    hSetBuffering logHandle LineBuffering
    putStrLn $ "calling with " ++ show logfile ++ " for stdout..."
    let p = (P.proc "./print_stdout_buffering" []) {P.std_out = P.UseHandle logHandle}
    (_, _, _, h) <- P.createProcess p
    void $ P.waitForProcess h
