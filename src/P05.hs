-- ~\~ language=Haskell filename=src/P05.hs
-- ~\~ begin <<docs/README.md|P05>>[0]
module P05 where

-- >>> set (heading each) "Addis Ababa"'x'
-- "xddis Ababa"
heading :: Traversal' s a -> Traversal' s a
heading = undefined

-- >>> set (tailing each) "Addis Ababa"'x'
-- "Axxxxxxxxxx"
tailing :: Traversal' s a -> Traversal' s a
tailing = undefined

-- >>> set (taking 3 each) "Addis Ababa"'x'
-- "xxxis Ababa"
taking :: Int -> Traversal's a -> Traversal's a
taking = undefined

-- >>> set (dropping 3 each) "Addis Ababa"'x'
-- "Addxxxxxxxx"
dropping :: Int -> Traversal's a -> Traversal's a
dropping = undefined

-- >>> set (filtering (<'d') each) "Addis Ababa"'x'
-- "xddisxxxxxx"
filtering :: (a -> Bool) -> Traversal's a -> Traversal's a
filtering = undefined

-- >>> set (element 1 each) "Addis Ababa"'x'
-- "Axdis Ababa"
element :: Int -> Traversal's a -> Traversal's a
element = undefined

-- Helper functions with the following signatures might be useful
trans1 :: Applicative f => (a -> f a) -> (a -> Compose (State Bool) f a)
trans1 = undefined

trans2 :: Applicative f => (a -> f a) -> (a -> Compose (State Int) f a)
trans2 = undefined

trans3 :: Applicative f => (a -> Bool) -> (a -> f a) -> (a -> f a)
trans3 = undefined
-- ~\~ end
