# .rut\_profile: What Is It?

This is my personal configuration for a Unix terminal. Because I spend so much time on a
terminal, I am always looking for ways to make the environment more productive. What you
will find in here is a compilation of tools I have found over time that make life on the
terminal a hell of a lot easier. 

In addition to making the files within this repository work great for me, I have tried my
best in the documentation to make the files easily modifiable and easy to add on to just
in case anyone else ever wanted to try this stuff out. 

In short, this is just a way better terminal.

# PSA

I have tried to install this profile on a terminal with oh-my-zsh installed. It didn't
work and almost broke the terminal. *So don't use if you are already using oh-my-zsh.*

# Installation / How to Use

1. Change directory to your home directory

    *   `cd` or `cd ~`

1. Clone the project (make sure you don't already have a directory called 
`.rut_profile`, silly)

    *   `git clone https://github.com/michael-rutledge/.rut_profile.git`

1. Change directory into `.rut_profile`

    *   `cd .rut_profile`

1. Run the link script

    *   If you already have your own dot files that you might care about, back them up

    *   Then run it: `./link.sh`

1. Run `source ~/.bashrc` to load changes

1. You are now up and running with the rut profile!

1. If you want to utilize your own environment variables/aliases, edit the script called
`customEnv.sh`. It is automatically created by the `link.sh` file and will automatically
be run any time `.bashrc` is sourced. This way, I don't encroach on any environment
variables you might want to use.

1. After any future changes you make to `customEnv.sh`, be sure to run `rebash` to load
those changes

    *   `rebash` is a custom alias from my .bashrc that will resource the profile

# Included Files

### .bashrc (and .bash\_profile)

Terminal appearance and functionality. Turns the default terminal into a masterpiece of
workflow and aesthetic.

`.bash_profile` is just there to source `.bashrc` when it is called automatically by some
terminals.

---
### .vimrc

My vim stuff. I like colors and line numbers. Got some cool tab stuff in there as well.

---
### link.sh

A shell command that creates links in home directory. Use to start everything up.
