mkdir dir2
echo Contents of foo! > dir2/foo.txt
cp bar.png dir2/
git hash-object -w dir2/foo.txt | xargs -I {} git update-index --add --cacheinfo 100644 {} dir2/foo.txt
git hash-object -w dir2/bar.png | xargs -I {} git update-index --add --cacheinfo 100644 {} dir2/bar.png
git update-index git-manual-commit.sh
tree=`git write-tree`
echo manual commit second attempt > changelog
head=`git rev-parse HEAD`
git commit-tree $tree -p $head < changelog | xargs git update-ref HEAD
rm changelog
git push origin master
