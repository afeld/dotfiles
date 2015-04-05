# Aidan's dotfiles

Moving towards one-liner setup of a development machine.

## Getting Started

Fork this repo, then run the following in a terminal:

```bash
cd ~
git clone YOUR_FORK_URL.git
cd dotfiles
./init.sh

# after Atom is installed
apm install --packages-file atom/packages.txt
# later, update the list
apm list --installed --bare > atom/packages.txt
```

## Software

I use the following pieces of software in my dev setup.

### Installed automatically by `init.sh`

* [brew](http://mxcl.github.com/homebrew/)
* [gifify](https://github.com/jclem/gifify)
* [hub](https://hub.github.com)
* [Node Version Manager (NVM)](https://github.com/creationix/nvm)
* [Ruby Version Manager (RVM)](https://rvm.io)

### Others that need to be installed manually

* Apps
    - [Atom](http://atom.io)
    - [Charles](http://www.charlesproxy.com/)
    - [Dropbox](http://db.tt/y5bnAOst)
    - [iTerm 2](http://www.iterm2.com)
        - Set "Load preferences from a custom folder or URL" to be `/Users/USER/dotfiles`
    - [refactor](https://github.com/afeld/refactor)
    - [Satellite Eyes](http://satelliteeyes.tomtaylor.co.uk/)
    - App Store
        - [1Password](https://itunes.apple.com/us/app/1password-password-manager/id443987910?mt=12)
        - [Caffeine](http://itunes.apple.com/us/app/caffeine/id411246225)
        - [Cloud](http://itunes.apple.com/us/app/cloud/id417602904)
        - [Dash](https://itunes.apple.com/us/app/dash/id458034879)
        - [Growl](https://itunes.apple.com/us/app/growl/id467939042?mt=12)
        - [Moom](https://itunes.apple.com/us/app/moom/id419330170?mt=12)
        - [Skitch](https://itunes.apple.com/us/app/skitch/id425955336?mt=12)
* Chrome extensions
    - [Authy](https://www.authy.com/)
    - [Awesome Screenshot](https://chrome.google.com/webstore/detail/awesome-screenshot-captur/alelhddbbhepgpmgidjdcjakblofbmce)
    - [Boomerang](http://www.boomeranggmail.com/)
    - [Github Notification Helper for GMail](https://chrome.google.com/webstore/detail/github-notification-helpe/gmhijkhbpihfmkmhmcfebmlkaekgmaje)
    - [JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc)
    - [Lazarus](https://chrome.google.com/webstore/detail/loljledaigphbcpfhfmgopdkppkifgno)
    - [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm)
    - [Weather](https://chrome.google.com/webstore/detail/weather/ihbiedpeaicgipncdnnkikeehnjiddck)
* Firefox extensions
    - [Firebug](https://www.getfirebug.com)
    - [JSONView](https://addons.mozilla.org/en-US/firefox/addon/jsonview/)

## Web-Based Tools

* [Ookla Speed Test](http://www.speedtest.net/)
* [Qualys SSL Labs](https://www.ssllabs.com/ssltest/)
* [RequestBin](http://requestb.in/)
* [W3C Markup Validation Service](http://validator.w3.org/)

## See Also

* [Zach Holman's](http://zachholman.com/) talk [Ruby Patterns from GitHub's Codebase](http://speakerdeck.com/u/holman/p/ruby-patterns-from-githubs-codebase?slide=7)
* [GitHub does dotfiles](http://dotfiles.github.com)
* [Flatiron School Environmentalizer](https://github.com/flatiron-school/environmentalizer/)
* Automation
    - [pivotal_workstation](https://github.com/pivotal/pivotal_workstation)
    - [soloist](https://github.com/mkocher/soloist)
    - [Kitchenplan](https://github.com/kitchenplan/kitchenplan)
    - [Boxen](https://boxen.github.com)
