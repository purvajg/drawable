1) Adding project to git.
- $ git init

2) Linking the project with github
- Create a new repository on GitHub. To avoid errors, do not initialize the new repository with README,
license, or gitignore files. You can add these files after your project has been pushed to GitHub.
- $ git checkout -b main
creating a branch main as git would first create master branch by git init
- $ git add
- $ git commit -m "bla bla"
- At the top of your GitHub repository's Quick Setup page, click  to copy the remote repository URL.
- Sets the new remote :
$ git remote add origin remote-repository-URL
- Verifies the new remote URL :
$ git remote -v
- Pushes the changes in your local repository up to the remote repository you specified as the origin
$ git push -u origin main



or follow this link:
https://docs.github.com/en/free-pro-team@latest/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line