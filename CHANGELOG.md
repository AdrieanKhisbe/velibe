# Change Log

All notable changes to *Velibe* will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]
## [0.2.3] - 2015-12-04
### Fixed
- ensure favorites stations are stored as integer
- prevent running test to destroy your config :)

## [0.2.2] - 2015-12-02
### Fixed
- fix broken due to missing import

## [0.2.1] - 2015-11-30
### Added
- documentation about new commands and config
### Fixed
- access to token in config file
- display of wrong station number

## [0.2.0] - 2015-11-29
### Added
- favorites storage with a `.velibe.yaml`
- commands to *display*, *add* and *reset* favorites
- CI setup (see badge on README): unit test, coverage, travis and coveralls

## [0.1.0] - 2015-11-18
### Changed
- Token must be specified with the `VELIBE_TOKEN` environment variable.

## [0.0.2] - 2015-11-11
### Added
- Data and draft of sqlite database for storing stations and some stats
### Fixed
- naming convention
### Changed
- Code refactor
- Usage of *http.rb* library

## [0.0.1] - 2015-07-04
- Initial Release

[unreleased]: https://github.com/AdrieanKhisbe/velibe/compare/v0.2.3...HEAD
[0.2.3]: https://github.com/AdrieanKhisbe/velibe/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/AdrieanKhisbe/velibe/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/AdrieanKhisbe/velibe/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/AdrieanKhisbe/velibe/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AdrieanKhisbe/velibe/compare/v0.0.2...v0.1.0
[0.0.2]: https://github.com/AdrieanKhisbe/velibe/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/AdrieanKhisbe/velibe/compare/02a6045....v0.10
