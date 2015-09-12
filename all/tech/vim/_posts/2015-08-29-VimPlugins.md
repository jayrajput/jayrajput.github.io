---
tile: VIM Plugins
---

First get the Pathogen

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Change directory

    cd ~/.vim/bundle 

Next get the plugins

    git clone git://github.com/tpope/vim-sensible.git
    git clone git://github.com/godlygeek/tabular.git

    
