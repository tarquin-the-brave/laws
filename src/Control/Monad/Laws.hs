module Control.Monad.Laws
  (
  -- * Monad laws
    associativity
  ) where

import Control.Monad ((>=>))

-- |
-- @
-- (m '>>=' f) '>>=' g ≡ m (f '>=>' g)
-- @
associativity
  :: (Monad m, Eq (m a), Eq (m c))
  => m a -> (a -> m b) -> (b -> m c) -> Bool
associativity m f g  = (m >>= f >>= g) == (m >>= (f >=> g))
