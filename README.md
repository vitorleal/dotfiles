# My .dotfiles colection :gem:

![My Terminal Colors](http://i.imgur.com/YcLgdoG.png)


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

