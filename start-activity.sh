#!/bin/bash
set -eu
umask 077

if ! command -v git >/dev/null 2>&1; then
  printf '%s\n' 'Git is required. Ask your instructor to check this computer.' >&2
  exit 1
fi

if command -v code >/dev/null 2>&1; then
  vscode=$(command -v code)
elif [[ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]]; then
  vscode="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
elif [[ -n "${LOCALAPPDATA:-}" ]] && command -v cygpath >/dev/null 2>&1 &&
     [[ -x "$(cygpath -u "$LOCALAPPDATA")/Programs/Microsoft VS Code/bin/code" ]]; then
  vscode="$(cygpath -u "$LOCALAPPDATA")/Programs/Microsoft VS Code/bin/code"
else
  printf '%s\n' 'Visual Studio Code was not found. Ask your instructor to check this computer.' >&2
  exit 1
fi

read -r -p 'Your GitHub username (for the folder name): ' username
if [[ ! "$username" =~ ^[A-Za-z0-9][A-Za-z0-9-]{0,38}$ ]]; then
  printf '%s\n' 'Enter your GitHub username without @ or a URL.' >&2
  exit 1
fi
read -r -p 'Your name for Git commits: ' author
read -r -p 'Your GitHub commit email (a GitHub noreply address also works): ' email
if [[ ! "$author" =~ [^[:space:]] || ! "$email" =~ ^[^[:space:]@]+@[^[:space:]@]+$ ]]; then
  printf '%s\n' 'Enter a name and a valid email for your commits.' >&2
  exit 1
fi

work_root="$HOME/HAU-Activities"
mkdir -p "$work_root"
workspace=$(mktemp -d "$work_root/$username.XXXXXX")
profile=$(mktemp -d "${TMPDIR:-/tmp}/hau-activity-vscode.XXXXXX")

unset GIT_CONFIG_PARAMETERS GIT_CONFIG_SYSTEM GIT_ASKPASS SSH_ASKPASS GH_TOKEN GITHUB_TOKEN
unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_COMMON_DIR VSCODE_IPC_HOOK_CLI
export GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1
case "$(uname -s)" in
  MINGW*|MSYS*) export GIT_CONFIG_GLOBAL=NUL ;;
esac
unset GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL EMAIL
export GIT_CONFIG_COUNT=4
export GIT_CONFIG_KEY_0=credential.helper GIT_CONFIG_VALUE_0=
export GIT_CONFIG_KEY_1=user.name GIT_CONFIG_VALUE_1="$author"
export GIT_CONFIG_KEY_2=user.email GIT_CONFIG_VALUE_2="$email"
export GIT_CONFIG_KEY_3=credential.https://github.com.username GIT_CONFIG_VALUE_3="$username"

printf '\nWork folder: %s\n' "$workspace"
printf '%s\n' 'In VS Code, open the Command Palette and select Git: Clone.' \
  'Paste your own private activity repo HTTPS URL and choose the work folder above.' \
  'When GitHub opens, verify the browser account before authorizing.' \
  'Use VS Code Source Control to commit and push. Check the commit on GitHub.' \
  'When finished, sign out in VS Code and GitHub in the browser, then close the lab window.'

cd "$workspace"
"$vscode" --new-window --user-data-dir "$profile" "$workspace"
printf '\nThis terminal is already in your work folder. After cloning, enter the cloned repo with cd.\n'
printf '%s\n' 'Use VS Code Source Control for sign-in and push. Type exit here when finished.'
"${BASH}" --noprofile --norc -i
