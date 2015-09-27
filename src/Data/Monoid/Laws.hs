{-# LANGUAGE CPP #-}
module Data.Monoid.Laws
  (
  -- * Monoid laws
    leftIdentity
  , rightIdentity
  , associativity
  , mconcat
  , Property
  ) where

#if MIN_VERSION_base(4,8,0)
import Prelude hiding (mconcat)
#else
import Data.Monoid (Monoid, mappend, mempty)
#endif
import Data.Monoid ((<>))
import qualified Data.Monoid as Monoid (mconcat)

type Property a = a -> Bool

-- |
-- @
-- 'mempty' '<>' x ≡ x
-- @
leftIdentity :: (Eq a, Monoid a) => Property a
leftIdentity x = mempty <> x == x

-- |
-- @
-- x '<>' 'mempty' ≡ x
-- @
rightIdentity :: (Eq a, Monoid a) => Property a
rightIdentity x = x <> mempty == x

-- |
-- @
-- x '<>' (y '<>' z) ≡ (x '<>' y) '<>' z
-- @
associativity :: (Eq a, Monoid a) => Property (a,a,a)
associativity (x,y,z) = x <> (y <> z) == (x <> y) <> z

-- * mconcat

-- |
-- @
-- 'mconcat' ≡ 'foldr' 'mappend' 'mempty'
-- @
--
-- This is only necessary when implementing 'Data.Monoid.mconcat' by hand.
mconcat :: (Eq a, Monoid a) => Property [a]
mconcat l = Monoid.mconcat l == foldr mappend mempty l
