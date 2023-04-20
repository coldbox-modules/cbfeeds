# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

* * *

## [Unreleased]

## [2.0.0] - 2023-04-20

### Added

- GitHub Actions CI
- ColdBox 7 Testing
- Some conversion to script
- Ability for this to work due to dumb ACF compiler bug on xml transform including xss paths

### Removed

- ACF11, ACF2016 Support

## 1.3.0

- Made `type` not mandatory for `atom:link` elements
- Media elements can also be placed under `media:content` elements as well as `media:group` elements according to the specs. <http://www.rssboard.org/media-rss#media-content>

## 1.2.0

- New module layout
- Removed useless entrypoints
- Lucee 5 Support
- ACF 2018 Support
- Fixes a bug that causes (German) umlauts to be improperly escaped
- Fixed issue with incorrect published and updated dates when consuming an Atom feed.
- Location protocol update
- ACF Incompatiblities on shared generator

## 1.1.0

- Travis CI integration
- Build process updates
- Template updates
- Fix on XML Formats for shared generator

## 1.0.1

- Fixes for newer email addresses on regex checking of feed generation

## 1.0.0

- Create first module version

[Unreleased]: https://github.com/coldbox-modules/cbfeeds/compare/v2.0.0...HEAD

[2.0.0]: https://github.com/coldbox-modules/cbfeeds/compare/658e8283163eb004053fd36c002d81b3490df126...v2.0.0

\[]: <https://github.com/coldbox-modules/cbfeeds/compare/ae28d3eb3faba4b25b6ad75f2d6365f768a670f1...v>
