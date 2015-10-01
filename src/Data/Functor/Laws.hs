module Data.Functor.Laws
  (
  -- * Functor laws
    identity
  , composition
  ) where

-- |
-- @
-- 'fmap' 'id' ≡ 'id'
-- @
identity :: (Eq (f a), Functor f) => f a -> Bool
identity x = fmap id x == x

-- |
-- @
-- 'fmap' (f . g) ≡ 'fmap' f . 'fmap' g
-- @
composition :: (Eq (f b), Functor f) => f c -> (a -> b) -> (c -> a) -> Bool
composition x f g  = fmap (f . g) x == (fmap f . fmap g) x
