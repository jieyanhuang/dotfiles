dotfiles
========

### How to use

1. Clone this repository.
   ```
   git clone https://github.com/jieyanhuang/dotfiles.git
   ```

2. Symlink the dotfiles that you need and edit as required.
   ```
   ln -s vimrc ~/.vimrc
   ln -s vim ~/.vim
   ln -s tmux.conf ~/.tmux.conf
   ...
   ```

   Note: To use base-16 shell, follow the steps below
   ```
   mkdir ~/.config; cd ~/.config; ln -s ~/dotfiles/base16-shell
   ```

3. Set up vim-plug:

   ```
   $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

4. Open vim and enter `:PlugInstall` and let vim-plug handle the rest


5. To modify theme of vim, tmuxline or promptline
   ```
   vi ~/.vimrc

   // Edit the following line
   let g:airline_theme = '<THEME HERE>'
   ```

6. PROFIT!
