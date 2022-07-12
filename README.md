# Aidan's dotfiles

Moving towards one-liner setup of a development machine.

## Getting Started

1. Install and open [Visual Studio Code](https://code.visualstudio.com/)
1. [Set up the VSCode command line helper](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line)
1. Fork this repo
1. Run the following in a terminal:

   ```bash
   cd ~
   git clone YOUR_FORK_URL.git
   cd dotfiles
   ./init.sh
   ```

You may need to run `./init.sh` a few times for it to successfully complete.

## Manual steps

### OSX settings

...that need to be changed manually:

- Keyboard
  - [Change modifier keys](https://support.apple.com/guide/mac-help/change-the-behavior-of-the-modifier-keys-mchlp1011/mac) to have Caps Lock act like Control
  - [Speed up the key repeat and shorten the delay](https://support.apple.com/guide/mac-help/set-how-quickly-a-key-repeats-mchl0311bdb4/mac)
- [Remove extraneous items from the Dock](https://support.apple.com/guide/mac-help/dock-mh35859/mac#mchlpf80766d)
- Trackpad
  - Increase tracking speed
  - Turn on App Expose
  - [Turn off "swipe between pages"](https://support.apple.com/guide/mac-help/change-trackpad-preferences-mchlp1226/10.14/mac/10.14)
- Finder
  - [Add folders to sidebar](https://support.apple.com/guide/mac-help/customize-finder-toolbar-sidebar-mac-mchlp3011/mac)
  - [Enable Path Bar](https://www.lifewire.com/use-macs-hidden-finder-path-bar-2260868)

### Other

- Install Purchased items from App Store
- [iTerm 2](http://www.iterm2.com)
  - Set "Load preferences from a custom folder or URL" to be `/Users/USER/dotfiles`

## Web-Based Tools

- [Fast.com](https://fast.com/)
- [MITM.cool](http://mitm.cool/)
- [RequestBin](http://requestb.in/)
- [W3C Markup Validation Service](http://validator.w3.org/)

## See Also

- [Zach Holman's](http://zachholman.com/) talk [Ruby Patterns from GitHub's Codebase](http://speakerdeck.com/u/holman/p/ruby-patterns-from-githubs-codebase?slide=7)
- [GitHub does dotfiles](http://dotfiles.github.com)
- [Flatiron School Environmentalizer](https://github.com/flatiron-school/environmentalizer/)
- Automation
  - [pivotal_workstation](https://github.com/pivotal/pivotal_workstation)
  - [soloist](https://github.com/mkocher/soloist)
  - [Kitchenplan](https://github.com/kitchenplan/kitchenplan)
  - [Boxen](https://boxen.github.com)
  - [Strap](https://github.com/mikemcquaid/strap)
