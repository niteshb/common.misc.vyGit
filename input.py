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
            'snippet': 'git commit -m "<msg>"',
        },
    ),
    (
        ['s'], 
        ['git status'],
        {
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
]

environmentVars = [
    # (SUFFIX, default, {[target], [Target]})
    ('REMOTE', 'github', {}),
    ('BRANCH', 'master', {}),
]
