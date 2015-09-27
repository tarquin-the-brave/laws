{-# LANGUAGE CPP #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Control.Applicative.Laws
  (
    -- * Applicative laws
    identity
  , composition
  , homomorphism
  , interchange
  , Property
  ) where

#if !MIN_VERSION_base(4,8,0)
import Control.Applicative (Applicative, (<$>), (<*>), pure)
#endif
import Data.Proxy (Proxy)

type Property a = a -> Bool

-- |
-- @
-- 'pure' id '<*>' v ≡ v
-- @
identity :: (Eq (f a), Applicative f) => Property (f a)
identity x = (pure id <*> x) == x

-- |
-- @
-- ('.') '<$>' u '<*>' v '<*>' w ≡  u '<*>' (v '<*>' w)
-- @
composition
  :: (Eq (f c), Applicative f)
  => Property (f (a -> b), f a, f (b -> c))
composition (v,w,u) = ((.) <$> u <*> v <*> w) == (u <*> (v <*> w))

-- |
-- @
-- 'pure' f '<*>' 'pure' x ≡ 'pure' (f x)
-- @
homomorphism
  :: forall f a b . (Applicative f, Eq b, Eq (f b))
  => Property (Proxy f, a, (a -> b))
homomorphism (_,x,f) = (pure f <*> (pure x :: f a)) == pure (f x)

-- |
-- @
-- u '<*>' 'pure' y ≡ 'pure' ('$' y) '<*>' u
-- @
interchange :: (Eq (f b), Applicative f) => Property (a, f (a -> b))
interchange (y,u) = (u <*> pure y) == (pure ($ y) <*> u)
