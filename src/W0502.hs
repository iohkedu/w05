{-# LANGUAGE RankNTypes #-}

module W0502
    ( BinTree (..), tree
      -- * Subtask W5.2.1
    , inorder, preorder, postorder
      -- * Subtask W5.2.2
    , printNodes, labelNodes
    ) where

import Optics

data BinTree a = Tip | Bin (BinTree a) a (BinTree a) deriving Show

tree :: BinTree Char         --        c
tree = Bin                   --       / \
  (Bin                       --      /   \
        (Bin Tip 'a' Tip)    --     b     d
        'b'                  --    / \   / \
        Tip)                 --   /
  'c'                        --  a
  (Bin Tip 'd' Tip)          -- / \

-- Subtask W5.2.1

-- | Traversal for traversing a @'BinTree' a@ in /in-order/ (left, value, right).
--
-- >>> toListOf inorder tree
-- "abcd"
--
inorder :: Traversal (BinTree a) (BinTree b) a b
inorder = error "TODO: implement inorder"

-- | Traversal for traversing a @'BinTree' a@ in /pre-order/ (value, left, right).
--
-- >>> toListOf preorder tree
-- "cbad"
--
preorder :: Traversal (BinTree a) (BinTree b) a b
preorder = error "TODO: implement preorder"

-- | Traversal for traversing a @'BinTree' a@ in /post-order/ (left, right, value).
--
-- >>> toListOf postorder tree
-- "abdc"
--
postorder :: Traversal (BinTree a) (BinTree b) a b
postorder = error "TODO: implement postorder"

-- Subtask W5.2.1

-- | Prints the values of the given tree in order of the given traversal.
--
-- >>> printNodes postorder tree
-- 'a'
-- 'b'
-- 'd'
-- 'c'

printNodes :: Show a => Traversal' (BinTree a) a -> BinTree a -> IO ()
printNodes _ _ = error "TODO: implement printNodes"

-- | Labels the nodes of the given tree in order of the given traversal, starting at 1.
--
-- >>> labelNodes preorder tree
-- Bin (Bin (Bin Tip ('a',3) Tip) ('b',2) Tip) ('c',1) (Bin Tip ('d',4) Tip)
--
labelNodes :: Traversal (BinTree a) (BinTree (a, Int)) a (a, Int) -> BinTree a -> BinTree (a, Int)
labelNodes _ _ = error "TODO: implement labelNodes"
