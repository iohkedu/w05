module W0503
    ( Delayed (..), loop, factorial, unsafeRunDelayed
      -- * Subtask W5.3.1
    , runDelayed
      -- * Subtask W5.3.3
    , tick, psum
      -- * Subtask W5.3.4
    , DelayedF (..), fromDelayed, toDelayed
      -- * Subtask W5.3.5
    , merge, firstSum
      -- * Subtask W5.3.6
    , biasedMerge, biasedFirstSum
    ) where

import Control.Applicative
import Control.Monad.Free

data Delayed a = Now a | Later (Delayed a)

loop :: Delayed a
loop = Later loop

factorial :: Int -> Delayed Int
factorial = go 1
 where
  go acc n | n <= 0    = Now acc
           | otherwise = Later (go (n * acc) (n - 1))

unsafeRunDelayed :: Delayed a -> a
unsafeRunDelayed (Now   x) = x
unsafeRunDelayed (Later d) = unsafeRunDelayed d

-- Subtask W5.3.1

-- | Extracts a result from the given computation if it is guarded by at most the
-- given number of 'Later' constructors.
--
-- >>> runDelayed 1000 loop
-- Nothing
--
-- >>> runDelayed 4 (factorial 4)
-- Just 24
-- >>> runDelayed 3 (factorial 4)
-- Nothing
--
runDelayed :: Int -> Delayed a -> Maybe a
runDelayed = error "TODO: implement runDelayed"

-- Subtask W5.3.2

instance Functor Delayed where
    fmap = error "TODO: implement fmap"

instance Applicative Delayed where
    pure = error "TODO: implement pure"
    (<*>) = error "TODO: implement (<*>)"

instance Monad Delayed where

    return = error "TODO: implement return"

    (>>=) = error "TODO: implement (>>=)"

-- Subtask W5.3.3

tick :: Delayed ()
tick = Later (Now ())

-- | TODO: Describe 'psum'.
psum :: [Int] -> Delayed Int
psum xs = sum <$> mapM (\x -> tick >> return x) xs

-- Subtask W5.3.4

data DelayedF a -- TODO: define DelayedF

instance Functor DelayedF where
    fmap = error "TODO: implement fmap"

fromDelayed :: Delayed a -> Free DelayedF a
fromDelayed = error "TODO: implement fromDelayed"

toDelayed :: Free DelayedF a -> Delayed a
toDelayed = error "TODO: implement toDelayed"

-- Subtask W5.3.5

instance Alternative Delayed where
    empty = loop
    (<|>) = merge

merge :: Delayed a -> Delayed a -> Delayed a
merge (Now x)   _         = Now x
merge _         (Now   x) = Now x
merge (Later p) (Later q) = Later (merge p q)

-- | Performs 'psum' on each of the integer lists and returns the result
-- that can be obtained with as few delays as possible.
--
-- >>> runDelayed 100 $ firstSum [repeat 1, [1,2,3], [4,5], [6,7,8], cycle [5,6]]
-- Just 9
--
firstSum :: [[Int]] -> Delayed Int
firstSum = error "TODO: implement firstSum"

-- Subtask W5.3.6

biasedMerge :: Delayed a -> Delayed a -> Delayed a
biasedMerge = error "TODO: implement biasedMerge"

-- | Function 'firstSum' using 'biasedMerge' instead of 'merge'.
--
-- >>> runDelayed 200 $ biasedFirstSum $ cycle [repeat 1, [1,2,3], [4,5], [6,7,8], cycle [5,6]]
-- Just 6
--
-- >>> runDelayed 200 $ biasedFirstSum $ replicate 100 (repeat 1) ++ [[1]] ++ repeat (repeat 1)
-- Just 1
--
biasedFirstSum :: [[Int]] -> Delayed Int
biasedFirstSum = error "TODO: implement biasedFirstSum"
