Installation:

    git clone git://github.com/viespejo/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Ignore untracked files in submodules

    for s in `git submodule  --quiet foreach 'echo $name'` ; do git config submodule.$s.ignore untracked ; done
    
Delete submodule

    Set path_to_submodule var (no trailing slash):

        path_to_submodule=path/to/submodule

    Delete the relevant line from the .gitmodules file:

        git config -f .gitmodules --remove-section submodule.$path_to_submodule

    Delete the relevant section from .git/config

        git config -f .git/config --remove-section submodule.$path_to_submodule

    Unstage and remove $path_to_submodule only from the index (to prevent losing information)

        git rm --cached $path_to_submodule

    Track changes made to .gitmodules

        git add .gitmodules

    Commit the superproject

        git commit -m "Remove submodule submodule_name"

    Delete the now untracked submodule files

        rm -rf $path_to_submodule
        rm -rf .git/modules/$path_to_submodule

Install nodejs (http://ghosttx.com/2012/04/nvm-cheat-sheet-node-version-manager)

    First Install prerequisites

        sudo apt-get install openssl libssl-dev

    Install Node Version Manager

        curl https://raw.github.com/creationix/nvm/master/install.sh | sh

    Use nvm to install node (now 0.8.18)

        nvm install v0.8.18

    Set default Node version to be used in any new shel (now 0.8)

        nvm alias default 0.8
    
    Install npm

        npm comes with node now
        Old Version: curl https://npmjs.org/install.sh | sh

Install jshint

    Use npm to install
    Edit /usr/local/lib/node_modules/jshint/lib/hint.js

        OLD
            // Remove potential Unicode Byte Order Mark.
            buffer = buffer.replace(/^\uFEFF/, '');
        NEW
            // Remove potential Unicode Byte Order Mark.
            buffer = buffer.replace(/^\uFEFF/, '');
            // Remove php tag
            buffer = buffer.replace(/<\?php.*?\?>/g, '');
            buffer = buffer.replace(/<\?=.*?\?>/g, 'null');

Install doctorjs (ctags to Javascript)
    
    cd /tmp
    git clone git://github.com/mozilla/doctorjs.git
    cd doctorjs
    git submodule init
    git submodule update
    (tested commit =  a12c27e3f8a373783d9d7a9bc642786a944aee7)
    sudo make install
    edit /usr/local/bin/jsctags to add .pjs extension

        OLD (line 186)
            } else if (ext === ".js" || ext === ".jsm") {
        NEW
            } else if (ext === ".js" || ext === ".jsm" || ext === ".pjs") {

Install phpctags  (php ctags index for vim plugin tagbar https://github.com/techlivezheng/phpctags

    cd ~
    git clone git://github.com/techlivezheng/phpctags.git
    cd phpctags
    curl -s http://getcomposer.org/installer | php
    php composer.phar install
    (.vimrc -----> let g:tagbar_phpctags_bin='~/phpctags/phpctags')
    
