cd C:\Users\nick\Nextcloud\lydia\jitterbug
set -e
git remote set-url origin https://github.com/nicksiv/jitterbug.git

git add .

git commit -m "rebuilding site"

git push origin master
