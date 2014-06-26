# Run code in Atom!

![](https://cloud.githubusercontent.com/assets/1694055/3226201/c458acbc-f067-11e3-84a0-da27fe334f5e.gif)

Run selections of code, code based on line number, or the whole file!

Currently supported grammars are:

  * AppleScript
  * Bash
  * Behat Feature
  * Coffeescript
  * CoffeeScript (Literate) <sup>^</sup>
  * Cucumber (Gherkin) <sup>*</sup>
  * Elixir
  * Erlang <sup>†</sup>
  * F# <sup>*</sup>
  * Go <sup>*</sup>
  * Groovy
  * Haskell
  * Javascript
  * Julia
  * LiveScript
  * Lua
  * MoonScript
  * newLISP
  * Perl
  * PHP
  * Python
  * RSpec
  * Ruby
  * Scala

**NOTE**: Some grammars may require you to install [a custom language package](https://atom.io/search?utf8=✓&q=language).

You only have to add a few lines in a PR to support another.

### Limitations

<sup>^</sup> Running selections of code for CoffeeScript (Literate) only works when selecting just the code blocks

<sup>†</sup> Erlang uses `erl` for limited selection based runs (see [#70](https://github.com/rgbkrk/atom-script/pull/70))

<sup>\*</sup> Cucumber (Gherkin), Go, and F# do not support selection based runs

## Installation

`apm install script`

or

Search for `script` within package search in the Settings View.

## Atom can't find node | ruby | python | my socks

Make sure to launch Atom from the console/terminal. This gives atom all your useful environment variables.

If you *really* wish to open atom from a launcher/icon, see [this issue for a variety of workarounds that have been suggested](https://github.com/rgbkrk/atom-script/issues/61#issuecomment-37337827).

## Usage

Make sure to run `atom` from the command line to get full access to your environment variables. Running Atom from the icon will launch using launchctl's environment.

Select some code and use **Script: Run** to run just that selection.

By default **Script: Run** will run your entire file.

Use **Script: Run at line** to run using the line [number] specific. Note that if you select an entire line this number could be off by one due to the way Atom detects numbers while text is selected.

**Script: Run Options** can be used to configure command options and program arguments.

**Script: Kill Process** will kill the process but leaves the pane open.

**Script: Close View** closes the pane and kills the process.

To kill everything, click the close icon in the upper right and just go back to
coding.

### Command and shortcut reference

| Command              | Mac OS X               | Linux/Windows               | Notes                                                   |
| -------------------- | ---------------------- | --------------------------- | ------------------------------------------------------- |
| Script: Run          | <kbd>cmd-i</kbd>       | <kbd>ctrl-b</kbd>           | If text is selected a selection based run will occur    |
| Script: Run at line  | <kbd>shift-cmd-j</kbd> | <kbd>shift-ctrl-j<kbd>      | If text is selected the line number will be the last    |
| Script: Run Options  | <kbd>shift-cmd-i</kbd> | <kbd>shift-ctrl-alt-o</kbd> | Runs the selection or whole file with the given options |
| Script: Close View   | <kbd>ctrl-w</kbd>      | <kbd>ctrl-w</kbd>           | Closes the script view window                           |
| Script: Kill Process | <kbd>ctrl-c</kbd>      | <kbd>ctrl-q</kbd>           | Kills the current script process                        |

## Development

Use the atom [contributing guidelines](https://atom.io/docs/latest/contributing).
They're pretty sane.

#### Quick and dirty setup

`apm develop script`

This will clone the `script` repository to `~/github` unless you set the
`ATOM_REPOS_HOME` environment variable.

#### I already cloned it!

If you cloned it somewhere else, you'll want to use `apm link --dev` within the
package directory, followed by `apm install` to get dependencies.

### Workflow

After pulling upstream changes, make sure to run `apm update`.

To start hacking, make sure to run `atom --dev` from the package directory.
Cut a branch while you're working then either submit a Pull Request when done
or when you want some feedback!
