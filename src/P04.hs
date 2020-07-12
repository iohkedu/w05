-- ~\~ language=Haskell filename=src/P04.hs
-- ~\~ begin <<docs/README.md|P04>>[0]
module P04 where

import           Control.Alternative.Free

data Delayed a = Now a | Later (Delayed a)
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[1]
loop :: Delayed a
loop = Later loop
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[2]
factorial :: Int -> Delayed Int
factorial = go 1
 where
  go acc n | n <= 0    = Now acc
           | otherwise = Later (go (n \* acc) (n - 1))
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[3]
unsafeRunDelayed :: Delayed a -> a
unsafeRunDelayed (Now   x) = x
unsafeRunDelayed (Later d) = unsafeRunDelayed d
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[4]
-- | 5.4.1
runDelayed :: Int -> Delayed a -> Maybe a
runDelayed = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[5]
-- | 5.4.2 Functor,Applicative, and Monad instances for =Delayed=.
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[6]
-- | 5.4.3

tick :: Delayed ()
tick = Later (Now ())

psum :: [Int] -> Delayed Int
psum xs = sum <\$> mapM (\x -> tick >> return x) xs
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[7]
-- | 5.4.4

fromDelayed :: Delayed a -> Free Delayed a
fromDelayed = undefined

toDelayed :: Free Delayed a -> Delayed a
toDelayed = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[8]

instance Alternative Delayed where
empty = loop
(<|>) = merge

merge :: Delayed a -> Delayed a -> Delayed a
merge (Now x)   _         = Now x
merge _         (Now   x) = Now x
merge (Later p) (Later q) = Later (merge p q)
-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[9]
-- | 5.4.5
-- ~\~ begin <<docs/README.md|function_documentation_for_firstSum>>[0]
-- Example:
--
-- >>> runDelayed 100 $ firstSum [repeat 1, [1,2,3], [4,5], [6,7,8], cycle [5,6]]
-- Just 9.
-- ~\~ end
firstSum :: [[Int]] -> Delayed Int
firstSum = undefined

-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[10]
biasedMerge :: Delayed a -> Delayed a -> Delayed a
biasedMerge = undefined

-- ~\~ end
-- ~\~ begin <<docs/README.md|P04>>[11]
-- ~\~ begin <<docs/README.md|documentation_for_biasedFirstSum_function>>[0]
-- | 5.4.6 firstSum in terms of biasedMerge
-- >>> :{
--   runDelayed 200 $
--     biasedFirstSum $
--       replicate 100 (repeat 1) ++ [[1]] ++ repeat (repeat 1)
-- :}
-- Just 1
-- ~\~ end

biasedFirstSum :: [[Int]] -> Delayed Int
biasedFirstSum = undefined

-- ~\~ end
