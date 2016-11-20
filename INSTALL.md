# edjanger installation steps
```bash
git clone https://github.com/pamtrak06/edjanger.git
cd edjanger; chmod 755 *.sh scripts/*.sh
./edjangerinstall.sh
source edjanger.alias
alias|grep edjanger
```

# edjanger github contribution mode
```bash
./edjangerinstall dev
```
This script will replace all path from $PWD (edjanger path installation) with {edjangerpath} and then make it possible to package for final packaging and push to github

```bash
git status
```
Update, rename move files, and then

```bash
git ls-files --modified | xargs git add
git ls-files --deleted -z | xargs -0 git rm
git add $(git ls-files -o --exclude-standard)
```

Commit
```bash
git commit -m "<comment>"
```

Contribute

```bash
git pull origin master
```

