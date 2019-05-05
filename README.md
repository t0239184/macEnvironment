---
title: Mac Enviroment
date: 2019-04-20 02:01:50
categories:
- Unix Like
tags:
- Mac
- HomeBrew
---
這篇文章主要在Mac的環境建置上，會寫這篇主要是之前剛好有換HDD到SSD，想說乾脆重裝一套乾淨的系統，同時也可以檢視一下有沒有什麼東西可以整合在一起的，還有哪些是不需要的，所以當初就記錄下來了，後來手上剛好有一台臨時的Air可以用，這篇記錄就派上了用場。

<!-- more -->

## Install HomeBrew
Linux上面都會有PackageManager，例如``apt-get`` ``yum`` ``pacman``  
任何軟體只要Repository上面有都可以安裝及管理，但Mac剛好缺少了這個東西，所以我們第一個就來裝它，之後軟體都靠它來管理會方便許多

[HomeBrew 官網](https://brew.sh/index_zh-tw)

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install Application-Upgrade plugin

```sh
$ brew tap buo/cask-upgrade
```

## Download Command

```sh
# zsh
# zsh-syntax-highlighting
# zsh-...
# youtube-dl
# mps-youtube - command line youtube player
# ffmpeg - youtube-dl dependency command
# tree
# wget
# mysql
# ntop
# gcc
# g++
# java
# maven
# docker
# tomcat

$ brew install zsh zsh-syntax-highlighting youtube-dl ffmpeg tree wget mysql ntop gcc g++ java maven docker tomcat
```

## Download Config file
```sh
$ git clone http://github.com/t0239184/macEnviroment.git
$ cd macEnviroment
$ cp .zshrc ~/.zshrc
$ cp .vimrc ~/.vimrc
```

## Macbook Air ICC描述檔修正
修正 2012 MacbookAir ICC描述檔使螢幕對比不強烈的問題

```sh
$ cp CustomMacRumors.icc /Library/ColorSync/Profiles/Display/CustomMacRumors.icc
```
開啟System Preferences > Displays > Color > Display profile : Color LCD

## Download Application

### Terminal
```sh
# iterm2-終端機軟體  macvim-GUI-Vim

$ brew cask install iterm2 macvim 
```

### Common Application
```sh
# smcfancontrol - 風扇管理
# karabiner-elements - 鍵盤映射管理
# spectacle - 視窗管理
# lacona - Super Spotlight
# the-unarchiver - 解壓縮軟體
# appcleaner - APP移除軟體

$ brew cask install smcfancontrol spectacle karabiner-element lacona the-unarchiver appcleaner
```


### Browser
```sh
$ brew cask install chrome firefox
```

### Edit
```sh
$ brew cask install macdown
```


### Quick look plugin
```sh
# qlcolorcode
# qlimagesize
# quicklook-json
# quickloog-pat

$ brew cask install qlcolorcode qlimagesize quicklook-json quickloog-pat
```


### Office
```sh
# libreoffice - OpenSource Office
# pages - iWork Word
# keynote - iWork PowerPoint

$ brew cask install libreoffice pages keynote
```


### Player
```sh
# iina - Movie Player
# vlc - Media Player

$ brew cask install iina vlc
```

### Image Edit
```sh
# gimp - OpenSource Image Edit
# photo image editor pixelstyle - Very like photoshop app

$ brew cask install gimp
```
### GitGUI
```sh
# sourcetree - GitGUI
# gitkraken - OpenSource GitGUI 特色為拖拉Branch

$ brew cask install sourcetree gitkraken
```

### IDE
```sh
$ brew cask install android-studio
```





