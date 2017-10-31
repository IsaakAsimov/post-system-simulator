# Post System simulator

A Post System is a rewriting system that can simulate a Post Machine. A Post Machine is a mathematical model of computation that manipulates sequences of symbols in different states. Much like a Turing machine manipulates a tape.
In fact Post Machines are equivalent to Turing machines, in terms of what is
possible to do with them, because both are Turing complete. 

A Post System is not exactly the same that a Post Machine. The difference is
that a Post System doesn't care about states, it just cares about words.

The first formal definition of a Post Machine was described by Emil Post
on 1936 in his paper called **Formulation 1**. But, he first published about
Post Systems in 1943, even thought he started developing this in 1920.

There are many different definitions of Post Systems, in fact, Emil Post
himself described a few different ones, but there are many others.

The purpose of this repository is to show a specific implementation of
this model, and simulate it in Haskell.

## Definition:

We will take as a Post System: A list of pairs of words. Where words are just
finite sequences of symbols.

To have a better understanding about this, I have to describe some notation
first:

First I'll have to make an order relation between words. So I'll say that:
-   A word **a** is less or equal than a worth **b**, if **a** is a
    prefix of **b**. Or in other words: **a** ≤ **b** if there is a word **c**
    such that, **ac = b**.

Now that we now this, we will understand what are the instructions to follow,
in order to make a Post System work.

When you have a Post System **P** (a list of pairs of words) , and an
initial word **w**. Then, the following instructions must be followed:

-   If **P** is empty:
    -   Then: Return **w**
    -   Else: Take the first pair **(u, v)** of **P**:
        -   If **u** ≤ **w**:
            -   Then: Find a word **q** such that **uq = w** and redefine **w =
                qv**. Then, start from the beginning with the original **P**
                and the redefined **w**.
            -   else: Redefine **P** as **P** without the first pair, and start
                over.

This pseudo-code instructions are very similar to the real implementation
in Haskell. In fact, the first instruction, is just a base case.

If you want to see how it works with an example see:
[EXAMPLE.md](https://github.com/Average-user/post-system-simulator/blob/master/EXAMPLE.md)
