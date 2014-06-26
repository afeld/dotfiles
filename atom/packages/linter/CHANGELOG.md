# v0.4.9
--------

### New Features
* Show error line and column if available in the status bar
* Lint on focus ([#77](https://github.com/AtomLinter/Linter/pull/77))
* Clicking error message copies it to clipboard ([#78](https://github.com/AtomLinter/Linter/issues/78))

### Bug Fixes
* Fix the error range construction and line reporting for line zero errors ([#35](https://github.com/AtomLinter/Linter/issues/35))
* Fix modify interval config ([#64](https://github.com/AtomLinter/Linter/issues/64))
* Close status bar on file close ([#74](https://github.com/AtomLinter/Linter/pull/74))
* Fix double error reporting in status bar ([#79](https://github.com/AtomLinter/Linter/pull/79))

### New Linters
* [linter-scalac](https://atom.io/packages/linter-scalac), for Scala, using `scalac`


# v0.4.8 (May 26, 2014)
-----------------------

### Bug Fixes
* Lint on save wasn't triggered with save menu shortcut ([#40](https://github.com/AtomLinter/Linter/issues/40))
* Not displaying results if cursor on EOF ([#50](https://github.com/AtomLinter/Linter/issues/50))
* Previous highlights weren't cleared

### Performance Improvements
* Wait 1000ms between two lint on changes ([#32](https://github.com/AtomLinter/Linter/issues/32))

### New Linters
* [linter-pylint](https://atom.io/packages/linter-pylint), for Python, using `pylint`
