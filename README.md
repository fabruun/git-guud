# Git Guud Bash Script

A small bash script that

1. Checks if the ssh-agent is running
    - If it isn't running then starts the ssh agent and adds the ssh key.
    - If it is running it does nothing but prompting it.
2. Adds the all the changes to local git repository.
3. Prompts the user for a git commit message.
4. Commits the added files into the local git repository with the message.
5. Pushes the code to remote repository.

**Note:** All of this can be mapped to a shortcut command inside neovim as I have done.
