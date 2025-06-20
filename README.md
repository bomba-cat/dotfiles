# Important
Make sure to create a backup of your current dotfiles, this will replace them all

# Install
```bash
cp -r ./* ~/
```

# Fixes
## i3
### Theme switcher broken
```bash
sudo chown -R $USER:$USER ~/.config/kitty/
sudo chown -R $USER:$USER ~/.config/i3/
```
