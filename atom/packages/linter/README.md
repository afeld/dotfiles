# Linter

Lint your code with ease in [Atom](http://atom.io).

![linter-jscs](https://github.com/AtomLinter/linter-jscs/raw/master/example.gif)

The idea is to stop the linter plugins war, by providing a top level API for linters to parse and display errors in the Atom editor.

## Available linters
- [linter-php](https://atom.io/packages/linter-php), for PHP using `php -l`
- [linter-phpcs](https://atom.io/packages/linter-phpcs), for PHP, using `phpc`
- [linter-phpmd](https://atom.io/packages/linter-phpmd), for PHP, using `phpmd`
- [linter-pylint](https://atom.io/packages/linter-pylint), for Python, using `pylint`
- [linter-javac](https://atom.io/packages/linter-javac), for Java, using `javac`
- [linter-jshint](https://atom.io/packages/linter-jshint), for JavaScript and JSON, using `jshint`
- [linter-jscs](https://atom.io/packages/linter-jscs), for JavaScript, using `jscs`
- [linter-scss-lint](https://atom.io/packages/linter-scss-lint), for SASS/SCSS, using `scss-lint`
- [linter-coffeelint](https://atom.io/packages/linter-coffeelint), for CoffeeScript, using `coffeelint`
- [linter-csslint](https://atom.io/packages/linter-csslint), for CSS, using `csslint`
- [linter-rubocop](https://atom.io/packages/linter-rubocop), for Ruby, using `rubocop`
- [linter-tslint](https://atom.io/packages/linter-tslint), for Typescript, using `tslint`
- [linter-xmllint](https://atom.io/packages/linter-xmllint), for XML, using `xmllint`
- [linter-shellcheck](https://atom.io/packages/linter-shellcheck), for Bash, using `shellcheck`.
- [linter-scalac](https://atom.io/packages/linter-scalac), for Scala, using `scalac`.

## Features

* **Lint on edit** – Instant error reporting for you! (And it's fast!)
* **Modular** – You install only the linters you need.
* **Active** – New linters are out every week.

## Installation

1. `$ apm install linter` – Install the main package.
2. `$ apm install linter-jshint` – Install the linter you need, here `jshint`.

## Configuration

* **Lint on save** [On / Off] - Lint the file when you save it
* **Lint on change** [On / Off] - Lint the file as you type
* **Show hightlighting** [On / Off] - Highlight the range of wrong code
* **Show gutters**: [On / Off] - Show dot in the gutter on line error
* **Show messages around cursor** [On / Off] - Show error description in the status bar
* **Show status bar when cursor is in error range** [On / Off] - Either show status bar when the cursor is on the error line, or show it when the cursor is focus the range of wrong code
* **Lint on change interval** [in ms] - Interval between two lints while you are writing code

## Commons errors

* `env: node: No such file or directory` – There's a problem with your node path – [check this](http://stackoverflow.com/a/20077620).

## Documentation
http://atomlinter.github.io/Linter/

## Coming soon

- linter-pep257, for python, using `pep257`.
- linter-ruby, for ruby, using `ruby -wc`.
- linter-rst, for reStructuredText, using `docutils`.
- linter-pyflakes, for python, using `pyflakes`.
- linter-phplint, for PHP, using `phplint`.
- linter-pep8, for python, using `pep8`.
- linter-lua, for Lua, using `luac -p`.
- linter-jsxhint, for JSX (React.js), using `jsxhint`.
- linter-jsl, for JavaScript, using `jsl`.
- linter-oclitnt, for C / C++ / Objective-C, using `OCLint`.
- linter-clang, for C / C++, using `clang`.

## Contributing

If you're going to submit a pull request, please try to follow
[the official contribution guidelines of Atom](https://atom.io/docs/latest/contributing).

You need `nodejs` and `grunt-cli` installed before contributing.
Run `bower install node` then `npm install -g grunt-cli`.

Also, run `$ grunt dev` before any submission and while developing, it will achieves severals tasks:

* Compile and lint the CoffeeScript files
* Lint the stylesheets
* Lint any trailing spaces and ensure new line at end of file

You can generate the doc with `$ grunt doc`, it will open in your default browser.

## Donation
[![Share the love!](https://chewbacco-stuff.s3.amazonaws.com/donate.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KXUYS4ARNHCN8)
[![donate-paypal](https://s3-eu-west-1.amazonaws.com/chewbacco-stuff/donate-paypal.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KXUYS4ARNHCN8)
