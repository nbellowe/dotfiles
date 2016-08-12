if has("user_commands")
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  let g:vundles=['general', 'python', 'programming', 'git']
  let g:neocomplcache_enable_at_startup = 1
  " Load 'vundles'
  source ~/.vim/vundles.vim
  " Bundle 'reponame'
endif

colorscheme desert
