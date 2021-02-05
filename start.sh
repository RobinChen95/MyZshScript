#!/bin/bash
# @Author: ( ´͈ ᵕ `͈ )◞♡ -> Cgq
# @Date:   2021-02-05 15:26:25
# @Last Modified time: 2021-02-05 15:46:27
# A zsh auto-deploy shell script for ubuntu
# Reference:https://github.com/iofu728/zsh.sh/blob/master/zsh.sh
# sh -c "$(curl -fsSL https://www.robinchen95.com/documents/install_zsh.sh)"

set -e

# constant params
ZSH=${ZSH:-~/.oh-my-zsh}
ZSH_CUSTOM=${ZSH}/custom
ALI_SOURCES='https://www.robinchen95.com/documents/sources.list'
OH_MY_ZSH_URL='https://www.robinchen95.com/documents/install_oh_my_zsh.sh'
SYNTAX_HIGHLIGHTING='https://github.com/zsh-users/zsh-syntax-highlighting.git'
ZSH_AUTOSUGGESTIONS='https://github.com/zsh-users/zsh-autosuggestions.git'

echo "换阿里源"
wget -c -O sources.list $ALI_SOURCES
mv ~/sources.list /etc/apt/
# 更新apt-get
sudo apt-get update
sudo apt-get upgrade
echo "安装git... ..."
sudo apt-get install git
# 如果没有zsh，需要先安装zsh
echo "安装zsh... ..."
sudo apt-get install zsh
# 安装必需的软件包
echo "安装build-essential... ..."
sudo apt-get install build-essential
# 安装Oh-My-Zsh
echo "安装Oh-My-Zsh... ..."
sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
# 切换bash至zsh
echo "exec zsh" >> ${ZDOTDIR:-$HOME}/.bashrc
# syntax_highlighting
echo "安装syntax_highlighting插件... ..."
git clone $SYNTAX_HIGHLIGHTING $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# 在.zshrc末尾添加 syntax highlighting
echo "source \$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
# zsh_autosuggestions
echo "安装zsh_autosuggestions插件... ..."
git clone $ZSH_AUTOSUGGESTIONS $ZSH_CUSTOM/plugins/zsh-autosuggestions
# 在.zshrc末尾添加 zsh-autosuggestions.
echo "source \$ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc