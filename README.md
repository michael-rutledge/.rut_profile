# HOW TO USE

1. Change directory to your home directory.

-`cd` or `cd ~`

2. Clone the project (make sure you don't already have a directory called 
`.rut_profile`, silly)

-`git clone https://github.com/michael-rutledge/.rut_profile.git`

3. Run the link script

-`./link.sh`

-If you already have your own dot files, delete them first. (They probably sucked anyway.)

4. You are good to go! Make any changes you want to customize it.

---
### .vimrc

My vim stuff. I like colors and line numbers. Got some cool tab stuff in there
as well.

---
### .bashrc

Terminal appearance. I like colors and stuff. Also tons of aliases in there.
Really helps with productivity.

---
### .gitconfig

Global git settings. Mostly used as of right now for just some aliasing.
Cool functions also include git log and git diff going through `less` and
maintaining colors.

---
### link.sh

A shell command that creates links in home directory. Use to start everything
up.
