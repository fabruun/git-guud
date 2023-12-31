#! /bin/bash

# Ensure that the ssh agent is up and running

if [ $(ps ax | grep [s]sh-agent | wc -l) -gt 0 ] ; then
    echo "ssh-agent is running!"
else
    eval $(ssh-agent -s)
    if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
        ssh-add ~/.ssh/github_key
    fi
    # Kill any extra agent that keeps hanging around.
    trap "ssh-agent -k" exit
fi

if [ -d .git ]; then
    echo "git repository already initialised"
else
    echo "git repository not initialised. Initiliasing now..."
    git init
    echo -n "Enter the name of the repository: "
    read repository
    git remote add origin "git@github.com:fabruun/${repository}"
fi

git add .
echo -n "Enter a commit message: "
read commitMessage
git commit -m commitMessage
git push
