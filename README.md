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

1. If you don't have XCode command line tools, you may need to run `./init.sh` again.

## OSX settings

...that need to be changed manually:

- Keyboard
  - [Change modifier keys](https://support.apple.com/guide/mac-help/change-the-behavior-of-the-modifier-keys-mchlp1011/mac) to have Caps Lock act like Control
  - [Speed up the key repeat and shorten the delay](https://support.apple.com/guide/mac-help/set-how-quickly-a-key-repeats-mchl0311bdb4/mac)
- [Remove extraneous items from the Dock](https://support.apple.com/guide/mac-help/dock-mh35859/mac#mchlpf80766d)
- Trackpad
  - Increase tracking speed
  - Turn on "tap to click"
  - Turn on App Expose
  - [Turn off "swipe between pages"](https://support.apple.com/guide/mac-help/change-trackpad-preferences-mchlp1226/10.14/mac/10.14)

## Software

I use the following pieces of software in my dev setup.

### Installed automatically by `init.sh`

- [asdf](https://asdf-vm.com/)
- [brew](http://mxcl.github.com/homebrew/)
- [hub](https://hub.github.com)

### Others that need to be installed manually

- Apps
  - [Dropbox](http://db.tt/y5bnAOst)
  - [iTerm 2](http://www.iterm2.com)
    - Set "Load preferences from a custom folder or URL" to be `/Users/USER/dotfiles`
  - [Satellite Eyes](http://satelliteeyes.tomtaylor.co.uk/)
  - App Store
    - [1Password](https://itunes.apple.com/us/app/1password-password-manager/id443987910?mt=12)
    - [Caffeine](http://itunes.apple.com/us/app/caffeine/id411246225)
    - [Cloud](http://itunes.apple.com/us/app/cloud/id417602904)
    - [Dash](https://itunes.apple.com/us/app/dash/id458034879)
    - [Moom](https://itunes.apple.com/us/app/moom/id419330170?mt=12)
    - [Skitch](https://itunes.apple.com/us/app/skitch/id425955336?mt=12)
- Chrome extensions
  - [Authy](https://www.authy.com/)
  - [Awesome Screenshot](https://chrome.google.com/webstore/detail/awesome-screenshot-captur/alelhddbbhepgpmgidjdcjakblofbmce)
  - [Boomerang](http://www.boomeranggmail.com/)
  - [Github Notification Helper for GMail](https://chrome.google.com/webstore/detail/github-notification-helpe/gmhijkhbpihfmkmhmcfebmlkaekgmaje)
  - [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc)
  - [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm)
- Firefox extensions
  - [JSONView](https://addons.mozilla.org/en-US/firefox/addon/jsonview/)

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
