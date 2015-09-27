# Change Log
All notable changes to this project will be documented in this file. See [Keep
CHANGELOG](http://keepachangelog.com/).

## [Unreleased][unreleased]
- Fork from [`smallcheck-laws`](https://github.com/jdnavarro/smallcheck-laws).

## [0.3] - 2015-09-07
### Added
- *Exhaustive* property testing using `Series` product. Previous
  properties renamed appending `Sum`.

### Changed
- Rename `mconcat` `Monoid` property.

## [0.2] - 2015-09-04
### Removed
- Move `Tasty` modules to a separate package
  [`tasty-laws`](https://hackage.haskell.org/package/tasty-laws).

## [0.1] - 2015-08-05
### Added
- Functor laws.
- Applicative laws.
- Monoid Laws.
- Monad laws.

[unreleased]: https://github.com/jdnavarro/smallcheck-laws/compare/v0.3...HEAD
[0.3]: https://github.com/jdnavarro/smallcheck-laws/compare/v0.2...v0.3
[0.2]: https://github.com/jdnavarro/smallcheck-laws/compare/v0.1...v0.2
[0.1]: https://github.com/jdnavarro/smallcheck-laws/compare/bf1caa...v0.1
