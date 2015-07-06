# My .dotfiles colection :gem:

[![Dotfiles](https://img.shields.io/badge/dot-files-green.svg)](https://dotfiles.github.io/)

![My Terminal Colors](http://i.imgur.com/oxyVDqE.png)


## OSX defaults

To configurate a new Mac with my default settings

```
$ source osx.sh
```


## Vim, Bash

To config my [Vim](http://www.vim.org/) settings and [Bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) configs, alias and exports just run the ```install.sh```

It will copy all the **.** files for you

```
$ source install.sh
```

After that install the **Vim** plugins using [Vundle](https://github.com/gmarik/Vundle.vim)

```
$ vim +PluginInstall +qall
```


## Homebrew

To install all my comandline apps using [homebrew](http://brew.sh/)

```
$ source brew.sh
```


## Homebrew Cask

To install all my apps using [Homebrew Cask](http://caskroom.io/)

```
$ source cask.sh
```


## NPM

To install the [NPM](http://npmjs.com) modules

```
$ source npm.sh
```


## Terminal Colors

The file ```my.terminal``` has the color settigns to use in the Mac's **Terminal** app

In terminal app go to **Preferences** > **Import** and choose the file to import. After that set it as **default**


## Author

| [![twitter/vitorleal](http://gravatar.com/avatar/e133221d7fbc0dee159dca127d2f6f00?s=80)](http://twitter.com/vitorleal "Follow @vitorleal on Twitter") |
|---|
| [Vitor Leal](http://vitorleal.com) |
