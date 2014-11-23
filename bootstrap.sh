HOMEDIR=/home/jjin/
DOTDIR=$HOMEDIR/dotfiles

VIMRC=vimrc
GVIMRC=gvimrc

if [ -e $HOMEDIR/.vim ]
then
  echo "Moving old .vim/ to .vim.old/"
  mv $HOMEDIR/.vim $HOMEDIR/.vim.old
fi
mkdir $HOMEDIR/.vim

link_pairs=(
        $DOTDIR/vimrc .vimrc
        $DOTDIR/gvimrc .gvimrc
        $DOTDIR/vim/fn.vim .vim/fn.vim
        $DOTDIR/vim/plug.vim .vim/plug.vim
        $DOTDIR/.Xresources .Xresources
        $DOTDIR/tmux.conf .conf
        $DOTDIR/mutt/muttrc .muttrc
        $DOTDIR/mutt/signature .signature
        $DOTDIR/bashrc .bashrc
        $DOTDIR/gitconfig .gitconfig
        $DOTDIR/gitignore_global .gitignore_global
)

for (( i = 0 ; i < ${#link_pairs[@]} ; i++)) do
  if [ -e $HOMEDIR/${link_pairs[$i+1]} ]
  then
    echo "Moving old ${link_pairs[$i+1]} to ${link_pairs[$i+1]}.old"
    mv ${link_pairs[$i+1]} ${link_pairs[$i+1]}.old
  fi

  ln -s ${link_pairs[$i]} $HOMEDIR/${link_pairs[$i+1]}
done
