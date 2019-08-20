# Changelog

The **goal** of this file is explaining to the users of our project the notable changes _relevant to them_ that occurred _between_ commits.

_The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html)_.

## [1.4] - 2019-08-20

### Added

- CHANGELOG.md file to track changes between commits

### Changed

- Base image from python:3.7-slim-stretch to python:3.7-slim-buster
- Webdriver from Chromedriver to Firefoxdriver to meet InstaPy 0.6.0 new requirement
- Disabled geckodriver log file on container root directory

### Fixed

- Issue with "Login A/B test detected error" - https://github.com/timgrossmann/InstaPy/issues/4887#issuecomment-522290752


## [1.3] - 2019-06-04

### Added

- CI with new Github's feature dependabot

### Changed

- Image build based on Docker Hub automated build


## [1.2] - 2019-04-23

### Changed

- Moving to python:3.7slim-strech image


## [1.1] - 2019-04-23

### Breaking Changes

- Moving to a single container instead of two : InstaPy + Selenium


## [1.0] - 2019-03-11

### Added

- Adding docker-compose files

## Changed

- Refactoring Dockerfile
