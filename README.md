# .dotfiles
Winters Dotfiles for Linux
## Usage
Most of the packages configured here are in pkg.txt. More major packages (such as xorg and pipewire) are also modified by these dotfiles, if you wish to have these configured they must also be installed. The list is in pkg-extras.txt. These can poth be installed with 

```sudo pacman -S - < pkg.txt```

It is recommened for security reasons to review the packages in these lists before preforming a blanket install.

GNUStow and symlinks can be used to link these files back to their proper locations. In order to do so simply run 

```stow $FILE$```

Files which are not within a directory should be symlinked to the home directory instead.

```ln -s $DOTFILE$ ~```
