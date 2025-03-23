Ciao Matteo del futuro, per aver tutto nvim funzionante devi ricordarti:

Per installare nvim:
- Installa prerequisiti (Debian):
```bash
sudo apt-get install ninja-build gettext cmake curl build-essential
git clone https://github.com/neovim/neovim
cd neovim
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=~/programmi/neovim"
make install
export PATH="~/programmi/neovim/bin:$PATH"
```

This way install it in /usr/local, 
- Pyright per lsp python:
    - ```pip install pyright``` dovrebbe bastare
- Installare con nvm treesetter-CLI
    - qui la cosa è meno banale
```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
source ~/.bashrc  # or `source ~/.zshrc`
nvm install --lts
nvm use --lts
npm install -g tree-sitter-cli
tree-sitter --version
```
