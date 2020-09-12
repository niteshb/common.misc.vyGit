@echo off
if x%1==xh   GOTO help
if x%1==x    GOTO help
if x%1==xa   GOTO add
if x%1==xc   GOTO commit
if x%1==xs   GOTO status
if x%1==xpl  GOTO pull
if x%1==xps  GOTO push 
if x%1==xl   GOTO log
if x%1==xl1  GOTO logOneline
if x%1==xt   GOTO test
if x%1==xr   GOTO remote_list
if x%1==xrgs GOTO remote_set_url
if x%1==xrg  GOTO remote_github
if x%1==xus  GOTO unstage
if x%1==xrm  GOTO delete
if x%1==xi   GOTO init
if x%1==xcl  GOTO clone
echo Invalid command. Type 'g h' to get help
GOTO exit

##############################################################
:test
@echo on
echo check %2
@echo off
GOTO exit

##############################################################
:help
@echo on
@echo Command Options:
@echo     g a       : git add [file1] [file2] [file3] ...
@echo     g c       : git commit -m "<msg>"
@echo     g s       : git status
@echo     g pl      : git pull --rebase
@echo     g ps      : git push
@echo     g l       : git log
@echo     g l1      : git log --oneline
@echo     g r       : git remote -v
@echo     g rgs     : git remote set-url github ^<repo_url^>
@echo     g rg      : git remote add github ^<repo_url^> : Also sets it as default remote for master
@echo     g us      : git restore --staged [file1] [file2] [file3] ... : Unstage files
@echo     g rm      : git rm [file1] [file2] [file3] ... : Delete files
@echo     g i       : git init
@echo     g cl      : git clone ^<repo_url^> [target_dir]
@echo     g h       : This help message
@echo off
GOTO exit

##############################################################
:add
@echo on
git add %2 %3 %4 %5 %6 %7 %8 %9
@echo off
GOTO exit

##############################################################
:commit
@echo on
git commit -m %2
@echo off
GOTO exit

##############################################################
:status
@echo on
git status
@echo off
GOTO exit

##############################################################
:pull
@echo on
git pull --rebase
@echo off
GOTO exit

##############################################################
:push
@echo on
git push
@echo off
GOTO exit

##############################################################
SET GIT_CMD_ONELINE=
:logOneline
SET GIT_CMD_ONELINE=--oneline
:log
@echo on
git log %GIT_CMD_ONELINE%
@echo off
SET GIT_CMD_ONELINE=
GOTO exit

##############################################################
:remote_list
@echo on
git remote -v
@echo off
GOTO exit

##############################################################
:remote_set_url
@echo on
git remote set-url github %2
@echo off
GOTO exit

##############################################################
:remote_github
@echo on
git remote add github %2
git config branch.master.remote github
git config branch.master.merge refs/heads/master
@echo off
GOTO exit

##############################################################
:unstage
@echo on
git restore --staged %2 %3 %4 %5 %6 %7 %8 %9
@echo off
GOTO exit

##############################################################
:delete
@echo on
git rm %2 %3 %4 %5 %6 %7 %8 %9
@echo off
GOTO exit

##############################################################
:init
@echo on
git init
@echo off
GOTO exit

##############################################################
:clone
@echo on
git clone %2 %3
@echo off
GOTO exit

##############################################################
:exit