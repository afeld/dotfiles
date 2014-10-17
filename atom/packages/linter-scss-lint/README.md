linter-scss-lint
=========================

This linter plugin for [Linter](https://github.com/AtomLinter/Linter) provides an interface to [scss-lint](https://github.com/causes/scss-lint). It will be used with files that have the “SCSS” syntax.

## Installation
Linter package must be installed in order to use this plugin. If Linter is not installed, please follow the instructions [here](https://github.com/AtomLinter/Linter).

### scss-lint installation
Before using this plugin, you must ensure that `scss-lint` is installed on your system. To install `scss-lint`, do the following:

1. Install [ruby](https://www.ruby-lang.org/).

2. Install [scss-lint](https://github.com/causes/scss-lint) by typing the following in a terminal:
   ```
   gem install scss-lint
   ```

Now you can proceed to install the linter-scss-lint plugin.

### Plugin installationd
```
$ apm install linter-scss-lint
```

## Settings
You can configure linter-scss-lint by editing ~/.atom/config.cson (choose Open Your Config in Atom menu):
```
'linter-scss-lint':
  'scssLintExecutablePath': null #scss-lint path. run 'which scss-lint' to find the path
  'scssLintExcludedLinters': [] # a list of linters to exclude from running. run 'scss-lint --show-linters' to see a list of linters that can be excluded.
```

## Contributing
If you would like to contribute enhancements or fixes, please do the following:

1. Fork the plugin repository.
1. Hack on a separate topic branch created from the latest `master`.
1. Commit and push the topic branch.
1. Make a pull request.
1. welcome to the club

Please note that modifications should follow these coding guidelines:

- Indent is 2 spaces.
- Code should pass coffeelint linter.
- Vertical whitespace helps readability, don’t be afraid to use it.

Thank you for helping out!
