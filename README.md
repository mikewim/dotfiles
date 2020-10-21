# Local Setup 
### The .vim folder holds all the plugins referenced in .vimrc using the vim 8 packages (:help packages). These plugins are brought in as git submodules. 
#### Steps to use on your machine:
`git clone https://github.com/mikewim/dotfiles.git`\
`cd dotfiles`\
`git submodule init`\
`git submodule update`

#### The zsh setup also expects [oh-my-zsh](https://ohmyz.sh/) to be in the home directory. Run this to download oh-my-zsh:
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

You can now copy whichever files you like into your home directory to use. :bowtie:

