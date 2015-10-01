{-# LANGUAGE CPP #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Control.Applicative.Laws
  (
    -- * Applicative laws
    identity
  , composition
  , homomorphism
  , interchange
  ) where

#if !MIN_VERSION_base(4,8,0)
import Control.Applicative (Applicative, (<$>), (<*>), pure)
#endif
import Data.Proxy (Proxy)

-- |
-- @
-- 'pure' id '<*>' v ≡ v
-- @
identity :: (Eq (f a), Applicative f) => f a -> Bool
identity x = (pure id <*> x) == x

-- |
-- @
-- ('.') '<$>' u '<*>' v '<*>' w ≡  u '<*>' (v '<*>' w)
-- @
composition
  :: (Eq (f c), Applicative f)
  => f (a -> b) -> f a -> f (b -> c) -> Bool
composition v w u = ((.) <$> u <*> v <*> w) == (u <*> (v <*> w))

-- |
-- @
-- 'pure' f '<*>' 'pure' x ≡ 'pure' (f x)
-- @
homomorphism
  :: forall f a b . (Applicative f, Eq b, Eq (f b))
  => Proxy f -> a -> (a -> b) -> Bool
homomorphism _ x f = (pure f <*> (pure x :: f a)) == pure (f x)

-- |
-- @
-- u '<*>' 'pure' y ≡ 'pure' ('$' y) '<*>' u
-- @
interchange :: (Eq (f b), Applicative f) => a -> f (a -> b) -> Bool
interchange y u = (u <*> pure y) == (pure ($ y) <*> u)
