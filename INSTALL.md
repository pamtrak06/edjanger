# edocker installation steps
```bash
git clone https://github.com/pamtrak06/edocker.git
cd edocker; chmod 755 *.sh scripts/*.sh
./edockerinstall.sh
source edocker.alias
alias|grep edocker
```

# edocker github contribution mode
```bash
./edockerinstall dev
```
Replace all path from $PWD (edocker path installation) with {edockerpath} and then make it possible to package for final packaging and push to github

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

