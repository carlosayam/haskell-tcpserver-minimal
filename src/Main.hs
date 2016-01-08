module Main where

import System.Environment (getArgs)
import qualified Network.Simple.TCP as TCP
import qualified Data.ByteString.Char8 as BSC

main :: IO ()
main = do
  [aHost, aPort] <- getArgs
  putStrLn $ "Serving on " ++ aHost ++ ":" ++ aPort
  TCP.serve (TCP.Host aHost) aPort $ \(socket, remoteAddr) -> do
    putStrLn $ "TCP Client: " ++ show remoteAddr
    printLoopBye socket
    -- or printLoop socket

-- A simple socket loop that reads lines
-- untils it gets a "bye\r\n" or client closes
printLoopBye socket = do
   mbs <- TCP.recv socket 128
   case mbs of
     Nothing  -> putStrLn "Closed!"
     Just bs -> do
       let chars = BSC.unpack bs
       case chars of
         "bye\r\n" -> putStrLn "Bye!"
         _ -> do
            putStr chars
            printLoopBye socket

-- A simple socket loop that reads lines
-- and finishes only when client closes
printLoop socket = do
   mbs <- TCP.recv socket 128
   case mbs of
     Nothing  -> putStrLn "Closed!"
     Just bs -> do
       let chars = BSC.unpack bs
       putStr chars
       printLoop socket

