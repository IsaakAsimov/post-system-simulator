import Systems
import Prelude hiding (Word)
import qualified Data.Sequence as S
import Data.Sequence ((<|), (><), fromList, empty, index, Seq)
import Data.Foldable (toList)

type Word  = Seq Char
type Pair  = (Word, Word)

fromPS :: [(String, String)] -> [Pair]
fromPS = map (\(a,b) -> (fromList a, fromList b))
                      --
s_head :: Seq a -> a
s_head x = index x 0

s_tail :: Seq a -> Seq a
s_tail = S.drop 1

{- It takes a word (w) and a pair of words (u,v), and returns a Maybe word.
   If u is prefix of w, returns (just (z++v)) where u++z = w.
   If u is not prefix of w returns Nothing                                  -}
newWord :: Word -> Pair -> Maybe Word
newWord w (u, v) | S.null u             = Just ((><) w v)
                 | S.null w             = Nothing
                 | s_head w == s_head u = newWord (s_tail w) ((s_tail u), v)
                 | otherwise            = Nothing

{- Iterates the word until there is no pair (u, v) such that u is prefix of
   word. Returns every word after every change (record).                    -}
postS :: Word -> [Pair] -> [Word]
postS initialWord initialPairs = f initialPairs initialWord []
    where f []    _    record = record
          f pairs word record = case new_word of
                                    Nothing  -> f (tail pairs) word record
                                    (Just x) -> f initialPairs x    (x:record)
                            where new_word = newWord word (head pairs)

runPostSystem :: String -> [(String, String)] -> [String]
runPostSystem word pairs
          = reverse $ map toList $ postS (fromList word) (fromPS pairs)
