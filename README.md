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
