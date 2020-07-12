-- ~\~ language=Haskell filename=src/P03.hs
-- ~\~ begin <<docs/README.md|P03>>[0]
module P03 where

data Tree a = Tip | Node (Tree a) a (Tree a) deriving Show
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[1]
inorder, preorder, postorder :: Traversal (Tree a) (Tree b) a b
inorder = undefined

preoder = undefined

postorder = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[2]
printNodes :: Show a => Traversal (Tree a) a -> Tree a -> IO ()
printNodes = undefined

labelNodes
  :: Traversal (Tree a) (Tree (a, Int)) a (a, Int) -> Tree a -> Tree (a, Int)
labelNodes = undefined
-- ~\~ end
-- ~\~ begin <<docs/README.md|P03>>[3]
tree :: Tree Char            --       c
tree = Node                  --      / \
  (Node                      --     /   \
        (Node Tip 'a' Tip)   --    b     d
        'b'                  --   / \   / \
        Tip
  )                         --  /
  'c'                        -- a
  (Node Tip'd' Tip)         -- / \
-- ~\~ end
