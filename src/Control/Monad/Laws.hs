module Control.Monad.Laws
  (
  -- * Monad laws
    associativity
  , Property
  ) where

import Control.Monad ((>=>))

type Property a = a -> Bool

-- |
-- @
-- (m '>>=' f) '>>=' g ≡ m (f '>=>' g)
-- @
associativity :: (Monad m, Eq (m a), Eq (m c)) => Property (m a, a -> m b, b -> m c)
associativity (m,f,g) = (m >>= f >>= g) == (m >>= (f >=> g))
