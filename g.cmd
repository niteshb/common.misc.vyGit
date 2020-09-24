@echo off
if x%VY_GIT_CMD_REMOTE%==x SET VY_GIT_CMD_REMOTE=github
if x%VY_GIT_CMD_BRANCH%==x SET VY_GIT_CMD_BRANCH=master
##############################################################
if x%1==xh         GOTO label_help
if x%1==xa         GOTO label_add
if x%1==xc         GOTO label_commit
if x%1==xs         GOTO label_status
if x%1==xpl        GOTO label_pull
if x%1==xps        GOTO label_push
if x%1==xl         GOTO label_log
if x%1==xl1        GOTO label_log_oneline
if x%1==xr         GOTO label_remote
if x%1==xus        GOTO label_unstage
if x%1==xrm        GOTO label_delete
if x%1==xi         GOTO label_init
if x%1==xcl        GOTO label_clone
##############################################################
if x%1==x          GOTO label_help
if x%1==x-h        GOTO label_help
if x%1==x--help    GOTO label_help
##############################################################
:label_remote
if x%2==x          GOTO label_remote_list
if x%2==xl         GOTO label_remote_list
if x%2==xlist      GOTO label_remote_list
if x%2==xs         GOTO label_remote_set_url
if x%2==xsu        GOTO label_remote_set_url
if x%2==xa         GOTO label_remote_add
GOTO label_invalid

##############################################################
:label_invalid
echo Invalid command. Type 'g h' to get help
GOTO label_exit

##############################################################
:label_help
@echo on
@echo Command Options:
@echo     g h         : This help message
@echo     g a         : git add [file1] [file2] [file3] ...
@echo     g c         : git commit -m "<msg>"
@echo     g s         : git status
@echo     g pl        : git pull --rebase %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%
@echo     g ps        : git push %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%
@echo     g l         : git log
@echo     g l1        : git log --oneline
@echo     g r         : git remote -v
@echo     g r s       : git remote set-url %VY_GIT_CMD_REMOTE% ^<repo_url^>
@echo     g r a       : git remote add %VY_GIT_CMD_REMOTE% ^<repo_url^> : Also sets %VY_GIT_CMD_REMOTE% as default remote for branch %VY_GIT_CMD_BRANCH%
@echo     g us        : git restore --staged [file1] [file2] [file3] ... : Unstage files
@echo     g rm        : git rm [file1] [file2] [file3] ... : Delete files
@echo     g i         : git init
@echo     g cl        : git clone ^<repo_url^> [target_dir]
@echo.
@echo Set environment variable 'VY_GIT_CMD_REMOTE' to set remote.
@echo If environment variable 'VY_GIT_CMD_REMOTE' is unset, then it defaults to 'github'.
@echo Remote is presently set to '%VY_GIT_CMD_REMOTE%'.
@echo.
@echo Set environment variable 'VY_GIT_CMD_BRANCH' to set branch.
@echo If environment variable 'VY_GIT_CMD_BRANCH' is unset, then it defaults to 'master'.
@echo Branch is presently set to '%VY_GIT_CMD_BRANCH%'.
@echo off
GOTO label_exit

##############################################################
:label_add
@echo on
git add %2 %3 %4 %5 %6 %7 %8 %9
@echo off
GOTO label_exit

##############################################################
:label_commit
@echo on
git commit -m %2
@echo off
GOTO label_exit

##############################################################
:label_status
@echo on
git status
@echo off
GOTO label_exit

##############################################################
:label_pull
@echo on
git pull --rebase %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%
@echo off
GOTO label_exit

##############################################################
:label_push
@echo on
git push %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%
@echo off
GOTO label_exit

##############################################################
:label_log
@echo on
git log
@echo off
GOTO label_exit

##############################################################
:label_log_oneline
@echo on
git log --oneline
@echo off
GOTO label_exit

##############################################################
:label_remote_list
@echo on
git remote -v
@echo off
GOTO label_exit

##############################################################
:label_remote_set_url
@echo on
git remote set-url %VY_GIT_CMD_REMOTE% %3
@echo off
GOTO label_exit

##############################################################
:label_remote_add
@echo on
git remote add %VY_GIT_CMD_REMOTE% %3
git config branch.%VY_GIT_CMD_BRANCH%.remote %VY_GIT_CMD_REMOTE%
git config branch.%VY_GIT_CMD_BRANCH%.merge refs/heads/%VY_GIT_CMD_BRANCH%
@echo off
GOTO label_exit

##############################################################
:label_unstage
@echo on
git restore --staged %2 %3 %4 %5 %6 %7 %8 %9
@echo off
GOTO label_exit

##############################################################
:label_delete
@echo on
git rm %2 %3 %4 %5 %6 %7 %8 %9
@echo off
GOTO label_exit

##############################################################
:label_init
@echo on
git init
@echo off
GOTO label_exit

##############################################################
:label_clone
@echo on
git clone %2 %3
@echo off
GOTO label_exit

##############################################################
:label_exit