# Example:

I'll use the palindrome system defined in
[Systems.hs](https://github.com/Average-user/post-system-simulator/blob/master/Systems.hs)
That i'll show here anyway:

```Haskell
palindrome :: [(String, String)]
palindrome =
  [ ("[IN]", "#")
  , ("0#0" , "#")
  , ("1#1" , "#")
  , ("1#0" , "1[NO]0")
  , ("0#1" , "0[NO]1")
  , ("1#"  , "[YES]")
  , ("0#"  , "[YES]")
  , ("#"   , "[YES]")
  , ("0"   , "0")
  , ("1"   , "1")
  ]
```
In action it would look like this:

```plain
Prelude> :l run-post-sytem.hs
[1 of 2] Compiling PostSystems      ( PostSystems.hs, interpreted )
[2 of 2] Compiling Main             ( run-post-sytem.hs, interpreted )
Ok, modules loaded: PostSystems, Main.
*Main> mapM_ putStrLn $ runPostSystem "[IN]10101" palindrome
[IN]10101
    10101#
     0101#1
      101#10
       01#101
        1#1010
           010#
            10#0
             0#01
                1#
                  [YES]
```
In fact I've given the indentation myself, just to show how the beginning of the
word is being taken, and another word is being pasted on the end.

In this case the first pair applied would be like this: (1,1). As you can see,
in this part
```plain
10101#
 0101#1
```
a 1 was taken from the beginning and a 1 was pasted on the end. But for example,
in this case:
```plain
1#1010
   010#
```
the pair applied would be like this (1#1, #), because a 1#1 was taken from the
beginning and a # was pasted at the end.

And in fact this pairs, and more are defined in
[Systems.hs](https://github.com/Average-user/post-system-simulator/blob/master/Systems.hs)
