@echo off
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==xtransfer GOTO label_transfer_start

REM '1st call' mode
set VY_ALIAS_BATCH_GEN_NO_DEBUG=y
if NOT x%1==xdebug GOTO label_start

REM 'debug' mode
echo Debug mode on
set VY_ALIAS_BATCH_GEN_NO_DEBUG=transfer
%0 %2 %3 %4 %5 %6 %7 %8 %9
GOTO label_exit

REM 'transfer' mode. Here we debug by setting VY_ALIAS_BATCH_GEN_NO_DEBUG=<blank>
:label_transfer_start
echo Tranferred into batchfile sub call
set VY_ALIAS_BATCH_GEN_NO_DEBUG=
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo arguments    :: (0, '%0') (1, '%1') (2, '%2') (3, '%3') (4, '%4') (5, '%5') (6, '%6') (7, '%7') (8, '%8') (9, '%9')
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo command line :: %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
echo ##############################################################
GOTO label_start

##############################################################
REM Actual start of the program
:label_start
if x%VY_GIT_CMD_REMOTE%==x SET VY_GIT_CMD_REMOTE=github
if x%VY_GIT_CMD_BRANCH%==x SET VY_GIT_CMD_BRANCH=master

:label_Switcher
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo label_Switcher & REM (Switcher) <- (help)
if x%1==xh         GOTO label_help
if x%1==x          GOTO label_help
if x%1==x-h        GOTO label_help
if x%1==x--help    GOTO label_help
if x%1==xa         GOTO label_add
if x%1==xus        GOTO label_unstage
if x%1==xrm        GOTO label_delete
if x%1==xren       GOTO label_rename
if x%1==xrename    GOTO label_rename
if x%1==xmv        GOTO label_move
if x%1==xmove      GOTO label_move
if x%1==xcm        GOTO label_commit_message
if x%1==xc         GOTO label_commit
if x%1==xpl        GOTO label_pull
if x%1==xps        GOTO label_push
if x%1==xs         GOTO label_status
if x%1==xss        GOTO label_status_short
if x%1==xl         GOTO label_log
if x%1==xl1        GOTO label_log_oneline
if x%1==xr         GOTO label_remote
if x%1==xi         GOTO label_init
if x%1==xcl        GOTO label_clone
if x%1==xb         GOTO label_branch
if x%1==xdf        GOTO label_difftool
if x%1==xdif       GOTO label_difftool
if x%1==xdiff      GOTO label_difftool
if x%1==xcon       GOTO label_config
GOTO label_invalid & REM (Switcher) <- (config)
:label_commit
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo label_commit & REM (commit) <- (commit_staged)
if x%2==x          GOTO label_commit_staged
if x%2==xa         GOTO label_commit_all
if x%2==xfix       GOTO label_commit_amend
if x%2==xamend     GOTO label_commit_amend
GOTO label_invalid & REM (commit) <- (commit_amend)
:label_remote
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo label_remote & REM (remote) <- (remote_list)
if x%2==x          GOTO label_remote_list
if x%2==xl         GOTO label_remote_list
if x%2==xlist      GOTO label_remote_list
if x%2==xs         GOTO label_remote_set
if x%2==xset       GOTO label_remote_set
if x%2==xa         GOTO label_remote_add
if x%2==xd         GOTO label_remote_default
if x%2==xdef       GOTO label_remote_default
if x%2==xdefault   GOTO label_remote_default
GOTO label_invalid & REM (remote) <- (remote_default)
:label_branch
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo label_branch & REM (branch) <- (branch_list)
if x%2==x          GOTO label_branch_list
if x%2==xl         GOTO label_branch_list
if x%2==xlist      GOTO label_branch_list
if x%2==xc         GOTO label_branch_create
if x%2==xsw        GOTO label_branch_switch
if x%2==xcsw       GOTO label_branch_create_switch
if x%2==xrm        GOTO label_branch_delete
if x%2==xdel       GOTO label_branch_delete
if x%2==xdelU      GOTO label_branch_delete_unmerged
if x%2==xren       GOTO label_branch_rename
if x%2==xd         GOTO label_branch_default
if x%2==xdef       GOTO label_branch_default
if x%2==xdefault   GOTO label_branch_default
GOTO label_invalid & REM (branch) <- (branch_default)
:label_config
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo label_config & REM (config) <- (config_vscode)
if x%2==xvsc       GOTO label_config_vscode
if x%2==xso        GOTO label_config_show_origin
GOTO label_invalid & REM (config) <- (config_show_origin)
:label_config_show_origin
if x%VY_ALIAS_BATCH_GEN_NO_DEBUG%==x echo label_config_show_origin & REM (config_show_origin) <- (config_show_origin_list)
if x%3==x          GOTO label_config_show_origin_list
if x%3==xi         GOTO label_config_show_origin_item
GOTO label_invalid & REM (config_show_origin) <- (config_show_origin_item)

##############################################################
:label_invalid
echo Invalid command. Type '%0 h' to get help
GOTO label_exit

##############################################################
:label_help
@echo on
@echo Command Options:
@echo   [92mg h        [0m   : [93mThis help message[0m
@echo   [92mg a        [0m   : [91mgit add ^<file1^> [file2] [file3] ...[0m : [93mAdd files to staging area[0m
@echo   [92mg us       [0m   : [91mgit restore --staged ^<file1^> [file2] [file3] ...[0m : [93mUnstage files[0m
@echo   [92mg rm       [0m   : [91mgit rm ^<file1^> [file2] [file3] ...[0m : [93mDelete files from repo[0m
@echo   [92mg ren      [0m   : [91mgit mv ^<oldname^> ^<newname^>[0m : [93mrename files[0m
@echo   [92mg mv       [0m   : [91mgit mv ^<src^> ^<dest^>[0m : [93mrename files[0m
@echo   [92mg cm       [0m   : [91mgit commit -m ^<msg^>[0m : [93mCommits staged with message provided[0m
@echo   [92mg c        [0m   : [91mgit commit[0m : [93mOpens your editor for commit message[0m
@echo   [92mg c a      [0m   : [91mgit commit -a[0m : [93mStages all ^& opens your editor for commit message[0m
@echo   [92mg c fix    [0m   : [91mgit commit --amend[0m : [93mChange your previous commit message[0m
@echo   [92mg pl       [0m   : [91mgit pull --rebase %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%[0m
@echo   [92mg ps       [0m   : [91mgit push %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%[0m
@echo   [92mg s        [0m   : [91mgit status[0m
@echo   [92mg ss       [0m   : [91mgit status -s[0m
@echo   [92mg l        [0m   : [91mgit log[0m
@echo   [92mg l1       [0m   : [91mgit log --oneline[0m
@echo   [92mg r        [0m   : [91mgit remote -v[0m : [93mList all remotes[0m
@echo   [92mg r s      [0m   : [91mgit remote set-url %VY_GIT_CMD_REMOTE% ^<repo-url^>[0m : [93mSet URL for a remote[0m
@echo   [92mg r a      [0m   : [91mgit remote add %VY_GIT_CMD_REMOTE% ^<repo-url^>[0m : [93mAlso sets %VY_GIT_CMD_REMOTE% as default remote for branch %VY_GIT_CMD_BRANCH%[0m
@echo   [92mg r d      [0m   : [91mset VY_GIT_CMD_REMOTE=^<remote^>[0m : [93mset default remote[0m
@echo   [92mg i        [0m   : [91mgit init[0m : [93mInitialize a git repository in a directory[0m
@echo   [92mg cl       [0m   : [91mgit clone --origin %VY_GIT_CMD_REMOTE% ^<repo-url^> [target-dir][0m
@echo   [92mg b        [0m   : [91mgit branch -a[0m : [93mList all branches[0m
@echo   [92mg b c      [0m   : [91mgit branch ^<branch^>[0m : [93mCreate branch[0m
@echo   [92mg b sw     [0m   : [91mgit switch ^<branch^>[0m
@echo   [92mg b csw    [0m   : [91mgit switch -c ^<branch^>[0m : [93mCreate ^& switch branch[0m
@echo   [92mg b rm     [0m   : [91mgit branch -d ^<branch^>[0m : [93mDelete merged branch[0m
@echo   [92mg b delU   [0m   : [91mgit branch -D ^<branch^>[0m : [93mDelete unmerged branch[0m
@echo   [92mg b ren    [0m   : [91mgit branch -m ^<old-branch-name^> ^<new-branch-name^>[0m : [93mRename unmerged branch[0m
@echo   [92mg b d      [0m   : [91mset VY_GIT_CMD_BRANCH=^<branch^>[0m : [93mset default branch[0m
@echo   [92mg df       [0m   : [91mgit difftool --no-prompt ^<file/folder^>[0m
@echo   [92mg con vsc  [0m   : [93mConfigure VSCode as git editor, difftool ^& mergetool[0m
@echo   [92mg con so   [0m   : [91mgit config --show-origin --list[0m
@echo   [92mg con so i [0m   : [91mgit config --show-origin ^<item^>[0m
@echo.
@echo Set environment variable 'VY_GIT_CMD_REMOTE' to set remote. default='github', current='%VY_GIT_CMD_REMOTE%'
@echo Set environment variable 'VY_GIT_CMD_BRANCH' to set branch. default='master', current='%VY_GIT_CMD_BRANCH%'
@echo off
GOTO label_exit

##############################################################
:label_add
@echo on
git add %2 %3 %4 %5 %6 %7 %8 %9
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
:label_rename
@echo on
git mv %2 %3
@echo off
GOTO label_exit

##############################################################
:label_move
@echo on
git mv %2 %3
@echo off
GOTO label_exit

##############################################################
:label_commit_message
@echo on
git commit -m %2
@echo off
GOTO label_exit

##############################################################
:label_commit_staged
@echo on
git commit
@echo off
GOTO label_exit

##############################################################
:label_commit_all
@echo on
git commit -a
@echo off
GOTO label_exit

##############################################################
:label_commit_amend
@echo on
git commit --amend
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
:label_status
@echo on
git status
@echo off
GOTO label_exit

##############################################################
:label_status_short
@echo on
git status -s
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
:label_remote_set
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
:label_remote_default
@echo on
set VY_GIT_CMD_REMOTE=%3
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
git clone --origin %VY_GIT_CMD_REMOTE% %2 %3
@echo off
GOTO label_exit

##############################################################
:label_branch_list
@echo on
git branch -a
@echo off
GOTO label_exit

##############################################################
:label_branch_create
@echo on
git branch %3
@echo off
GOTO label_exit

##############################################################
:label_branch_switch
@echo on
git switch %3
set VY_GIT_CMD_BRANCH=%3
@echo off
GOTO label_exit

##############################################################
:label_branch_create_switch
@echo on
git switch -c %3
set VY_GIT_CMD_BRANCH=%3
@echo off
GOTO label_exit

##############################################################
:label_branch_delete
@echo on
git branch -d %3
@echo off
GOTO label_exit

##############################################################
:label_branch_delete_unmerged
@echo on
git branch -D %3
@echo off
GOTO label_exit

##############################################################
:label_branch_rename
@echo on
git branch -m %3 %4
@echo off
GOTO label_exit

##############################################################
:label_branch_default
@echo on
set VY_GIT_CMD_BRANCH=%3
@echo off
GOTO label_exit

##############################################################
:label_difftool
@echo on
git difftool --no-prompt %2
@echo off
GOTO label_exit

##############################################################
:label_config_vscode
@echo on
git config --global core.editor "code --wait"
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd "code --wait $MERGED"
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
@echo off
GOTO label_exit

##############################################################
:label_config_show_origin_list
@echo on
git config --show-origin --list
@echo off
GOTO label_exit

##############################################################
:label_config_show_origin_item
@echo on
git config --show-origin %4
@echo off
GOTO label_exit

##############################################################
:label_exit