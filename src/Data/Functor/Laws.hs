module Data.Functor.Laws
  (
  -- * Functor laws
    identity
  , composition
  , Property
  ) where

type Property a = a -> Bool

-- |
-- @
-- 'fmap' 'id' ≡ 'id'
-- @
identity :: (Eq (f a), Functor f) => Property (f a)
identity x = fmap id x == x

-- |
-- @
-- 'fmap' (f . g) ≡ 'fmap' f . 'fmap' g
-- @
composition :: (Eq (f b), Functor f) => Property (f c, a -> b, c -> a)
composition (x,f,g) = fmap (f . g) x == (fmap f . fmap g) x
