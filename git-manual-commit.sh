#prepare git working directory
mkdir git-manual-commit
cd git-manual-commit
git init

#make manual commit
mkdir dir1
echo Contents of foo! > dir1/foo.txt
cp ../bar.png dir1/
git add .
git write-tree | xargs git commit-tree -p HEAD -m "manual commit creating" | xargs git update-ref HEAD

#add readme and this script, then push all changes to github 
git remote add origin git@github.com:Yankovsky/git-manual-commit.git
cp ../git-manual-commit.sh .
echo see solution in git-manual-commit.sh script > README.md
git add .
git commit -am "adding git-manual-commit.sh script"
git push -u origin master
