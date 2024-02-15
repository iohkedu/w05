{-# LANGUAGE RankNTypes #-}

module W0504
    ( heading, tailing, taking, dropping, filtering, element
    -- * Useful helper functions
    , trans1, trans2, trans3
    ) where

import Control.Monad.State  (State)
import Data.Functor.Compose (Compose (..))
import Optics

-- | Focuses on the first element of the given traversal's focuses.
--
-- >>> set (heading each) "Kenya" 'x'
-- "xenya"
-- >>> set (heading each) "" 'x'
-- ""
--
heading :: Traversal' s a -> Traversal' s a
heading _ _ = error "TODO: implement heading"

-- | Focuses on the same elements as the given traversal, skipping the first one.
--
-- >>> set (tailing each) "Kenya" 'x'
-- "Kxxxx"
-- >>> set (tailing each) "y" 'x'
-- "y"
-- >>> set (tailing each) "" 'x'
-- ""
--
tailing :: Traversal' s a -> Traversal' s a
tailing _ _ = error "TODO: implement tailing"

-- | Keeps the given number of focuses from the given traversal.
--
-- >>> set (taking 3 each) "Kenya" 'x'
-- "xxxya"
-- >>> set (taking 3 each) "yy" 'x'
-- "xx"
--
taking :: Int -> Traversal' s a -> Traversal' s a
taking _ _ = error "TODO: implement taking"

-- | Drops the given number of focuses from the given traversal.
--
-- >>> set (dropping 3 each) "Kenya" 'x'
-- "Kenxx"
-- >>> set (dropping 3 each) "yy" 'x'
-- "yy"
--
dropping :: Int -> Traversal' s a -> Traversal' s a
dropping _ _ = error "TODO: implement dropping"

-- | Keeps on those focuses of the given traversal
-- that satisfy the given property.
--
-- >>> set (filtering (<'d') each) "Ulaanbaatar" 'x'
-- "xlxxnxxxtxr"
--
filtering :: (a -> Bool) -> Traversal' s a -> Traversal' s a
filtering _ _ = error "TODO: implement filtering"

-- | Focuses on the focus of the given traversal with the given zero-based index.
--
-- >>> set (element 1 each) "Ulaanbaatar" 'x'
-- "Uxaanbaatar"
-- >>> set (element 100 each) "Ulaanbaatar" 'x'
-- "Ulaanbaatar"
--
element :: Int -> Traversal' s a -> Traversal' s a
element _ _ = error "TODO: implement element"

-- Helper functions with the following signatures might be useful:

trans1 :: Applicative f => (a -> f a) -> (a -> Compose (State Bool) f a)
trans1 = undefined

trans2 :: Applicative f => (a -> f a) -> (a -> Compose (State Int) f a)
trans2 = undefined

trans3 :: Applicative f => (a -> Bool) -> (a -> f a) -> (a -> f a)
trans3 = undefined
