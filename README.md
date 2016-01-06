Absolute minimalistic TCP server in Haskell for beginners that
prints all what it receives to the console.

Clone, cd into folder, $ stack build and $ stack exec tcpserver

Connect with $ telnet 127.0.0.1 9100

There are two simple socket reading loops. The current one
allows a telnet client as above to finish connection by sending
"bye" on a line of its own. The other loop (commented out) implementation
reads forever until the client closes.

It is based on network-simple, and it is written for Haskell
beginners (like me), without fancy-dandy monad operators.
