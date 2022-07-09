# `nvim-nyx-ide`

# Disclaimer
Created and tested on MacBook Air M1 with macOS Monterey 12.4.

# Installing neovim from source

## Dependencies
Make sure you have automake installed on your system.
```bash
brew install automake
```
## Installation steps
Clone [neovim repo](https://github.com/neovim/neovim.git).
```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.7.2
```

Build neovim.
```bash
make CMAKE_BUILD_TYPE=Release
sudo make install
```

# Install `nvim-nyx-ide`
```bash
git clone https://github.com/vasilecampeanu/nvim-nyx-ide.git ~/.config/nvim
```