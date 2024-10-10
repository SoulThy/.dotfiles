# My dotfiles
## How to setup
After cloning the repository you must create symlinks.
### For dotfiles inside the the "windows" folder
In the cmd run:
```cmd
mklink /D FolderLinkName C:\Users\Name\OriginalFolder
```
If you are creating a symlink to a file and not a folder exclude the '/D' tag
### For dotfiles inside the "linux" folder
In the terminal run:
```bash
ln -s [ORIGINAL-FILE] [LINK]
```

