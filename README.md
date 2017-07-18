# HOW TO USE

1. Change directory to your home directory.

    * `cd` or `cd ~`

1. Clone the project (make sure you don't already have a directory called 
`.rut_profile`, silly)

    * `git clone https://github.com/michael-rutledge/.rut_profile.git`

1. If you want to utilize your own environment variables, create a script called `customEnv.sh`.
It will automatically be run by the `.bashrc` file. This way, I don't encroach on any environment
variables you might want to use. Examples of good variables for you to use:

    *   `CDPATH`: works like the `PATH` variable except for `cd`, allowing you to change into a directory that is far away from your relative location. For example, instead of calling `cd ~/Desktop/repos/yourFavoriteRepo` when you are in `~/Documents/projects/somewhereFarAway`, you can set your `CDPATH` to `.:~:~/Desktop/repos` so when you call `cd`, each directory given in `CDPATH` will be checked, meaning you can just call `cd yourFavoriteRepo`. (Make sure to always include `.` in your `CDPATH`. Otherwise you won't be able to call `cd` normally because it won't check your local directory)

1. Run the link script

    * `./link.sh`

    * If you already have your own dot files, delete them first. (They probably sucked anyway.)

1. You are good to go! Make any changes you want to customize it.

---
### .vimrc

My vim stuff. I like colors and line numbers. Got some cool tab stuff in there as well.

---
### .bashrc

Terminal appearance and functionality. Turns the default terminal into a masterpiece of workflow and aesthetic. 

---
### .inputrc

Bash key settings. Used only for autocomplete right now.

---
### .gitconfig

Global git settings. Mostly used as of right now for just some aliasing. Cool functions also include git log and git diff going through `less` and maintaining colors.

---
### link.sh

A shell command that creates links in home directory. Use to start everything up.
