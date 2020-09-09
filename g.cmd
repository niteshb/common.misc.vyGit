@echo off
SET oneline=
if x%1==xh GOTO help
if x%1==xa GOTO add
if x%1==xc GOTO commit
if x%1==xs GOTO status
if x%1==xpl GOTO pull
if x%1==xps GOTO push 
if x%1==xl GOTO log
if x%1==xl1 GOTO logOneline
if x%1==xt GOTO test
if x%1==xr GOTO remote_list
if x%1==xrgs GOTO remote_set_url
if x%1==xrg GOTO remote_github
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
@echo     g a       : git add [file2] [file3] [file4] [file5] [file6]
@echo     g c       : git commit -m "<msg>"
@echo     g s       : git status
@echo     g pl      : git pull --rebase
@echo     g ps      : git push
@echo     g l       : git log
@echo     g l1      : git log --oneline
@echo     g r       : git remote -v
@echo     g rgs     : git remote set-url github "<repo_url>"
@echo     g rg      : git remote add github "<repo_url>" and set it as default remote for master
@echo     g h       : This help message
@echo off
GOTO exit

##############################################################
:add
@echo on
git add %2 %3 %4 %5
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
:logOneline
SET oneline=--oneline
:log
@echo on
git log %oneline%
@echo off
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
:exit