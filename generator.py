import re
from input import commands, environmentVars

outputFileName = 'g.cmd'
ofid = open(outputFileName, 'w')

envVarTemplates = [
    """if x%VY_GIT_CMD_{suffix}%==x SET VY_GIT_CMD_{suffix}={default}
""", """@echo Set environment variable 'VY_GIT_CMD_{suffix}' to set {target}. default='{default}', current='%VY_GIT_CMD_{suffix}%'
""",
]

cmdTemplates = [
    """if x%{order}==x{short:<9} GOTO label_{label}
""", """@echo     g {short:<9} : {snippet}
""", """##############################################################
:label_{label}
@echo on
{commands}
@echo off
GOTO label_exit

""",
]

envVarOutputs = [''] * len(envVarTemplates)
cmdOutputs = [''] * len(cmdTemplates) + [''] + ['']
class COIdx():
    MainShortSwitcher = 0
    HelpSnippets = 1
    Commands = 2
    OtherShortsSwitcher = 3
    SubCommandsSwitcher = 4


gTemplate = open('g.template.txt').read()

for commandInfo in commands:
    shorts = commandInfo[0]
    commands = commandInfo[1]
    cmdDict = commandInfo[2]
    keys = cmdDict.keys()
    verb = commands[0].split(' ')[1] if len(commands) else None
    #if verb: shorts.append(verb)
    label = cmdDict['label'] if 'label' in keys else verb
    plabel = cmdDict['parent-label'] if 'parent-label' in keys else None
    short = cmdDict['short'] if 'short' in keys else shorts[0]
    snippet = cmdDict['snippet'] if 'snippet' in keys else commands[0]
    commandsStr = '\n'.join(commands)
    order = len(short.split())
    hasSubCommands = True if (order > 1) else False
    subCommandSwitcher = hasSubCommands or plabel
    if plabel: # puts parent command's label in SubCommandsSwitcher
        cmdOutputs[COIdx.SubCommandsSwitcher] += ':label_' + plabel + '\n'
    for idx, cmdTemplate in enumerate(cmdTemplates):
        if not(
            (idx == COIdx.Commands and len(commands) == 0) or
            (idx == COIdx.MainShortSwitcher and subCommandSwitcher and not plabel)):
            cLabel = plabel if (idx == COIdx.MainShortSwitcher and plabel) else label
            cmdOutputs[idx] += cmdTemplate.format(
                short=short,
                label=cLabel,
                commands=commandsStr,
                snippet=snippet,
                order=1,
            )
    shortsStartIdx = 0 if subCommandSwitcher else 1
    for short in shorts[shortsStartIdx:]:
        coIdx = COIdx.SubCommandsSwitcher if subCommandSwitcher else COIdx.OtherShortsSwitcher
        cShort = (short + ' ').split(' ')[1] if subCommandSwitcher else short
        cmdOutputs[coIdx] += cmdTemplates[0].format(
            short=cShort,
            label=label,
            order=2 if subCommandSwitcher else 1,
        )

for environmentVar in environmentVars:
    suffix = environmentVar[0]
    default = environmentVar[1]
    target = suffix.lower()
    Target = target[0].upper() + target[1:]
    for idx, envVarTemplate in enumerate(envVarTemplates):
        envVarOutputs[idx] += envVarTemplate.format(
            suffix=environmentVar[0],
            default=environmentVar[1],
            target=target,
            Target=Target,
        )
gTemplate = gTemplate.format(COIdx=COIdx)
gTemplate = gTemplate.replace('{ ', '{')
gTemplate = gTemplate.replace(' }', '}')
out = gTemplate.format(ev=envVarOutputs, cmd=cmdOutputs)
ofid.write(out)
ofid.close()
