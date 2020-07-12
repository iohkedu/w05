-- ~\~ language=Haskell filename=src/P02.hs
-- ~\~ begin <<docs/README.md|P02>>[0]
module P02 where

import           Numeric.Natural

_Natural :: Prism'Integer Natural

-- ^ Examples of _Natural
-- >>> Preview _Natural 42
-- Just 42
-- >>> Preview _Natural -7
-- Nothing
-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[1]
  -- ~\~ begin <<docs/README.md|function_documentation_for_TheOne>>[0]
  -- | focus should be the given element
  --
  -- Examples:
  --
  -- >>> preview (_TheOne'x') 'x'
  -- Just ()
  --- >>> preview (_TheOne'x') 'y'
  -- Nothing
  -- >>> preview (_TheOne'x') ()
  --'x'
  -- ~\~ end

_TheOne :: Eq a => a -> Prism' a ()
_TheOne = undefined

-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[2]
newtype Checked a = Checked { unChecked :: a } deriving Show
-- ~\~ end
-- ~\~ begin <<docs/README.md|P02>>[3]
  -- ~\~ begin <<docs/README.md|function_documentation_for_Check>>[0]
  -- >>> preview (_Check odd) 42
  -- Nothing
  -- >>> preview (_Check odd) 17
  -- Just (Checked {unChecked = 17})
  -- >>> review (_Check odd) (Checked 3)
  -- 3
  -- ~\~ end
_Check :: (a -> Bool) -> Prism'a (Checked a)
_Check = undefined
-- ~\~ end
