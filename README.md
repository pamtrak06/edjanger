# edocker
Scripts for easyest docker commands in a docker working folder (Dockerfile)

Annoying about repeating docker commands with long parameters ?
Don't want to write a docker-compose yaml for your testing Dockerfile ?

Try edocker !
## ! Warrantly !
Script edocker_install.sh is updating your bash environnement (~/.bash_aliases, ...) at your own risk.
Please read the script before any installation.

## How to install edocker
edocker must be installed in /usr/local/edocker, like:
'''
cd /usr/local; git clone https://github.com/pamtrak06/edocker.git
cd edocker; chmod 755 *.sh
'''

Put edocker in your PATH:
'''
export PATH=$PATH:/usr/local/edocker
'''

## How to activate edocker for a project
Go to your working docker folder
'''
cd [docker working project]
'''
Copy the edocker.cfg model in your working docker folder
'''
cp /usr/local/edocker/edocker.cfg [docker working project] 
'''
Configure your edocker.cfg with correct parameters
By example, you could create a Dockerfile with this path :
'''
vi [docker working project]/build/Dockerfile
'''
Run th edocker installation
'''
edcoker-install.sh
'''
Execute the generated alias file
'''
source [basename for <docker working project>].alias
'''
You could remove those aliases by execute :
'''
source [basename for <docker working project>].unalias
'''
Your ~/bash_aliases contain alias activation for future bash sessions like:
'''
source [basename for <docker working project>].alias
'''

## How to use edocker for a project
Now you've got aliases to run all your docker commands like:
- d[basename for <docker working project>]build
- d[basename for <docker working project>]images
- d[basename for <docker working project>]rmi
- d[basename for <docker working project>]rum
- d[basename for <docker working project>]ps
- d[basename for <docker working project>]rm
- d[basename for <docker working project>]start
- d[basename for <docker working project>]stop
- d[basename for <docker working project>]logs
- d[basename for <docker working project>]inspect

!!! All thoses aliases are available only when you're in your project folder ([docker working project]) '''

Tips: create those two aliases with replacing the correct path for your project
'''
alias cdedocker='cd /usr/local/edocker'
alias cd[basename for <docker working project>]='cd [docker working project]'
'''
