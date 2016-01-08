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

I hope you already know the fundamental concept of type signatures. The code does not have many, but do have a look at the type signature of _TCP.serve_ in the link above.

Anonymous functions (lambdas) are also there; after all the signature requires a function and the code just provides one.

You will see the operator `$`, which is very common in normal Haskell code. This because it is a way to avoid parenthesis in a call like `f a (g p1 p2)`; using `$` it becomes `f a $ g p1 p2`. This because function application in Haskell (white space!) binds stronger that all operators, and `$` as operator has very low precedence. Besides, I bet you got your curry too ;-)

The code also uses the basics of `do` notation, specially for IO. The points that hopefully will make you _click_ are:

* That `do` notation is still a way to write functions that return _actions_ in IO. The type `IO a`, encapsulates the idea of an _action_ that when performed in the _world_, gives something of type `a`.

* The beauty of this is that Haskell still has [referential transparency](https://en.wikipedia.org/wiki/Referential_transparency), i.e. is _pure_. This despite something like `getArgs`, a _constant_ of type `IO [String]`  (see [reference](http://hackage.haskell.org/package/base-4.8.1.0/docs/System-Environment.html#v:getArgs); it is a symbol without paramaters, it is a constant!) may _encapsulate_, as action, different things when executed at different times, as we have in the code.

* By the way, a _worldy action_ whose result is not available to the Haskell program - like you don't care about it - has type `IO ()`, where `()` represents an uninteresting type which has a single value in it. If you are familiar with C, it is like the type `void`.

* With above in mind, the notation `pattern <- IO-expression` allows you to capture the result of an action when the result matters. If the result does not matter, you can simply write the right hand side without the pattern part.

* If you need to call a non-action function inside `do` notation, you use `let ...` to embed/write non-IO actions.

With the above in mind, have a look at the code.

So, I hope that with this and a little bit of more Haskell, you will be able to modify the above to make the server behave differently.
