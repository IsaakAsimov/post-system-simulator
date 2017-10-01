{- This package doesn't do anything without the run-post-system.hs file. This
   just a place to have different systems organizated.-}

module Systems (unaryToBinary, palindrome) where

{- Should return [YES] if the word is a palindromic one, and [NO]* where the
   star is some irrelevant rest of the word.

  If the initial word is [IN]101 should return [YES], and if its [IN]1101 should
  return [NO]10                                                              -}
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

{- Takes a word of 0s (unary representation of numbers)
   and returns the same number but in its binary form.

   If the initial word is '[in]000', the final word should be: '[fi]11'
   because the number 3 in unary is 000 and in binary is 11.           -}
unaryToBinary :: [(String, String)]
unaryToBinary =
  [ ("0", "0")
  , ("1", "1")
  , ("#", "#")
  , ("|", "|")

  , ("[in]", "#|[a]")

  , ("[a]00", "0[a]")
  , ("[a]#" , "#0[b]")
  , ("[a]0#", "#1[b]")

  , ("[b]0" , "0[b]")
  , ("[b]1" , "1[b]")
  , ("[b]|#", "[fi]")
  , ("[b]|" , "|[a]")
  ]
