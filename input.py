commands = [
    (
        ['h', '', '-h', '--help'], 
        [],
        {
            'label': 'help',
            'snippet': 'This help message',
        },
    ),
    (
        ['a'], 
        ['git add %2 %3 %4 %5 %6 %7 %8 %9'],
        {
            'snippet': 'git add [file1] [file2] [file3] ...',
        },
    ),
    (
        ['c'],
        ['git commit -m %2'],
        {
            'snippet': 'git commit -m "<msg>" : Commits staged with message provided',
            'label': 'commit_message_staged',
            'parent-label': 'commit_message',
        },
    ),
    (
        ['c a'],
        ['git commit -a -m %2'],
        {
            'snippet': 'git commit -a -m "<msg>" : Stages all ^& commits with message provided',
            'label': 'commit_message_all',
        },
    ),
    (
        ['c fix', 'c amend'],
        ['git commit --amend'],
        {
            'snippet': 'git commit --amend : Change your previous commit message',
            'label': 'commit_amend',
        },
    ),
    (
        ['ce'], 
        ['git commit'],
        {
            'snippet': 'git commit : Opens your editor for commit message',
            'label': 'commit_editor_staged',
            'parent-label': 'commit_editor',
        },
    ),
    (
        ['ce a'], 
        ['git commit -a'],
        {
            'snippet': 'git commit -a : Stages all ^& opens your editor for commit message',
            'label': 'commit_editor_all',
        },
    ),
    (
        ['s'], 
        ['git status'],
        {},
    ),
    (
        ['ss'],
        ['git status -s'],
        {
            'label': 'status_short'
        },
    ),
    (
        ['pl'], 
        ['git pull --rebase %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%'],
        {},
    ),
    (
        ['ps'], 
        ['git push %VY_GIT_CMD_REMOTE% %VY_GIT_CMD_BRANCH%'],
        {},
    ), 
    (
        ['l'], 
        ['git log'],
        {},
    ),
    (
        ['l1'], 
        ['git log --oneline'],
        {
            'label': 'log_oneline',
        },
    ),
    (
        ['r', 'r l', 'r list'], 
        ['git remote -v'],
        {
            'label': 'remote_list',
            'parent-label': 'remote',
        },
    ),
    (
        ['r s', 'r set'], 
        ['git remote set-url %VY_GIT_CMD_REMOTE% %3'],
        {
            'label': 'remote_set',
            'snippet': 'git remote set-url %VY_GIT_CMD_REMOTE% ^<repo_url^>',
        },
    ),
    (
        ['r a'], 
        [
            'git remote add %VY_GIT_CMD_REMOTE% %3',
            'git config branch.%VY_GIT_CMD_BRANCH%.remote %VY_GIT_CMD_REMOTE%',
            'git config branch.%VY_GIT_CMD_BRANCH%.merge refs/heads/%VY_GIT_CMD_BRANCH%',
        ],
        {
            'label': 'remote_add',
            'snippet': 'git remote add %VY_GIT_CMD_REMOTE% ^<repo_url^> : Also sets %VY_GIT_CMD_REMOTE% as default remote for branch %VY_GIT_CMD_BRANCH%',
        },
    ),
    (
        ['us'],
        ['git restore --staged %2 %3 %4 %5 %6 %7 %8 %9'],
        {
            'label': 'unstage',
            'snippet': 'git restore --staged [file1] [file2] [file3] ... : Unstage files',
        },
    ),
    (
        ['rm'],
        ['git rm %2 %3 %4 %5 %6 %7 %8 %9'],
        {
            'label': 'delete',
            'snippet': 'git rm [file1] [file2] [file3] ... : Delete files',
        },
    ),
    (
        ['i'],
        ['git init'],
        {},
    ),
    (
        ['cl'],
        ['git clone %2 %3'],
        {
            'snippet': 'git clone ^<repo_url^> [target_dir]',
        },
    ),
    (
        ['b', 'b l', 'b list'],
        ['git branch -a'],
        {
            'snippet': 'git branch -a : List all branches',
            'label': 'branch_list',
            'parent-label': 'branch',
        },
    ),
    (
        ['b sw'],
        [
            'git switch %3',
            'set VY_GIT_CMD_BRANCH=%3',
        ],
        {
            'snippet': 'git switch ^<branch^>',
            'label': 'branch_switch',
        },
    ),
    (
        ['b csw'],
        [
            'git switch -c %3',
            'set VY_GIT_CMD_BRANCH=%3',
        ],
        {
            'snippet': 'git switch ^<branch^> after creating it: Create ^& switch branch',
            'label': 'branch_create_switch',
        },
    ),
    (
        ['b c'],
        ['git branch %3'],
        {
            'snippet': 'git branch ^<branch^>: Create branch',
            'label': 'branch_create',
        },
    ),
    (
        ['b rm', 'b del'],
        ['git branch -d %3'],
        {
            'snippet': 'git branch -d ^<branch^> : Delete merged branch',
            'label': 'branch_delete',
        },
    ),
    (
        ['b delU'],
        ['git branch -D %3'],
        {
            'snippet': 'git branch -D ^<branch^> : Delete unmerged branch',
            'label': 'branch_delete_unmerged',
        },
    ),
    (
        ['b ren'],
        ['git branch -m %3 %4'],
        {
            'snippet': 'git branch -m ^<old-branch-name^> ^<new-branch-name^> : Rename unmerged branch',
            'label': 'branch_rename',
        },
    ),
    (
        ['df', 'dif', 'diff'],
        ['git difftool --no-prompt %2'],
        {
            'snippet': 'git difftool --no-prompt ^<file/folder^>',
        },
    ),
    (
        ['con vsc'],
        [
            'git config --global core.editor "code --wait"',
            'git config --global merge.tool vscode',
            'git config --global mergetool.vscode.cmd "code --wait $MERGED"',
            'git config --global diff.tool vscode',
            'git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"',
        ],
        {
            'snippet': 'Configure VSCode as git editor, difftool ^& mergetool',
        },
    ),
]

environmentVars = [
    # (SUFFIX, default, {[target], [Target]})
    ('REMOTE', 'github', {}),
    ('BRANCH', 'master', {}),
]
