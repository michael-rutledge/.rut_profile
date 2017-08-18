#!/bin/bash

# Use once to link real files from your home directory here

LITERAL_PS1="export PS1=\"\[\${cyan}\]\h\[\${nc}\]:\[\${magenta}\]\\\\t_\
\[\${b_yellow}\]\w\[\${green}\]\\\$(parse_git_branch) \[\${nc}\]\\\$ \""

ln -f -s "$(pwd)"/.vimrc "$HOME"/.vimrc
ln -f -s "$(pwd)"/.bashrc "$HOME"/.bashrc
ln -f -s "$(pwd)"/.bash_profile "$HOME"/.bash_profile

# create customEnv.sh if not already there
if ! [ -f "customEnv.sh" ]; then
    echo -e \
"# This is customEnv.sh. Put any personal environment variables here\n\
# Anything you put here won't be affected by git changes\n\
# If you repeat a variable from the bashrc, it will overwrite to your value\n\
#\n\
# A default shell prompt variable, PS1, has been provided for you\n\
# Feel free to change it to your liking, and have fun with modding!\n\
\n# Shell prompt\n\
${LITERAL_PS1}
"\
> customEnv.sh
    echo "Creating customEnv.sh..."
fi
# finally, load bashrc and call rebash to just make sure
echo "Files linked. Run 'source ~/.bashrc' to complete installation."
