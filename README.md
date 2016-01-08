Absolute minimalistic TCP server in Haskell, for beginners. It prints all what it receives to the console.

Project was bootstrapped with _stack_. A quick guide [here](http://seanhess.github.io/2015/08/04/practical-haskell-getting-started.html)

_Stack_ is a recent effort in the Haskell ecosystem to improve reproducibility of builds. It is
based on _Cabal_, which you should also get familiar with.

After getting _stack_ and your environment setup, then clone the repo, cd into folder and issue

```bash
$ stack build
$ stack exec tcpserver 127.0.0.1 9000
```

You can connect to the server in another terminal using

```bash
$ telnet 127.0.0.1 9000
```

The code is based on [network-simple](https://hackage.haskell.org/package/network-simple-0.4.0.4/docs/Network-Simple-TCP.html#g:3).

The code is pretty simple as well. You only need to understand few things of Haskell to read it or change it.
* Type signatures -of course-, and have a look at the signature of _TCP.serve_ above
* Anonymous functions, after all the signature requires a function and the code just provide one
* What `$` is, a way to avoid parenthesis in `f a (g p1 p2)` by doing `f a $ g p1 p2`. (And I bet you got your curry too ;-)
* Basics of do notation, specially for IO. And within this you need to understand these things:
    That are simply writing functions that return an IO action, `IO a`, where `a` is the type of the _result_ (for lack of a better word) that the _world_ will give back to your program as a result of performing that action.
    If the world and you do not care about results, the type of that result is `()` - like `void` in C.
    That `pattern <- IO-expression` allows you to capture the result of an action when the result matters
    `let ...` to embed/write non-IO actions, so called pure functions ;-), inside a do
    That executing an IO action can be done by itself in the do

So, apart from the functional programming basics, I think the above summarise what you need to understand the code and make some more advanced changes.


