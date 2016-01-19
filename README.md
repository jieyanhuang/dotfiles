dotfiles
========

### How to use

* Note that YouCompleteMe requires a minimum of vim 7.4+

1. Clone this repository.
   ```
   git clone https://github.com/jieyanhuang/dotfiles.git
   ```

2. Set up Vundle:

   ```
	 $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	 
   ```

3. Open your .vimrc in vim and install other plugins

	 ```
	 > vim ~/.vimrc
	 ```
   In vim enter `:PluginInstall` and let Vundle handle the rest

3. Symlink the dotfiles that you need and edit as required.
   ```
   ln -s vimrc ~/.vimrc
   ln -s vim ~/.vim
   ln -s tmux.conf ~/.tmux.conf
   ...
   ```

4. To modify theme of vim, tmuxline or promptline
   ```
   vi ~/.vimrc
   
   // Edit the following line
   let g:airline_theme = '<THEME HERE>'
   
   // Take snapshots for tmuxline & promptline by running..
   :TmuxlineSnapshot! ~/.tmuxline.sh
   :PromptlineSnapshot! ~/.shell_prompt.sh airline
   ```

5. PROFIT!
