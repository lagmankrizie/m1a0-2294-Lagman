# Set up your M1A0 activity

You need Git and Visual Studio Code. Install Dart 3.11.5 or newer within Dart 3.

## Create your private activity repo

Accept the invitation to [HAU-6ADET](https://github.com/HAU-6ADET). If the instructor already gave you an activity repo, use it. Otherwise, choose **Use this template → Create a new repository** on the starter, set the owner to **HAU-6ADET**, and choose **Private**.

Name your repo `m1a0-CLASSCODE-USERNAME`. Replace CLASSCODE with the numeric class code shown in your Canvas course and USERNAME with your GitHub username. The required prefix is `m1a0-CLASSCODE-` with your actual class code. Use your activity repo for the code and your separate student workspace for notes.

## Download and start the launcher

**Download [start-activity.sh](start-activity.sh) before cloning.** Open the file on the GitHub template, click **Download raw file**, and save it in Downloads as `start-activity.sh`. On Mac, open **Terminal**. On Windows, open **Git Bash** from Git for Windows. Run these commands from that standalone terminal.

```bash
cd "$HOME/Downloads"
bash ./start-activity.sh
```

If you saved it elsewhere, change into that folder first. Enter your GitHub username, name and GitHub commit email when asked. The launcher opens a fresh VS Code profile and leaves a terminal prompt in the new work folder. The prompts set your Git commit identity. GitHub sign-in happens separately.

## Clone and check your Git setup

1. On GitHub, open your **private activity repo**. Click **Code → HTTPS** and copy the clone URL.
2. In the VS Code window opened by the launcher, press **Shift+Command+P** on Mac or **Ctrl+Shift+P** on Windows. Type **Git: Clone** and select it.
3. Paste the HTTPS URL and press Enter. When VS Code asks where to clone it, choose the **work folder** printed by the launcher. Git creates a repo folder inside it.
4. If GitHub prompts you to sign in, check the account in the browser and authorize with your own account. When VS Code asks whether to open the cloned repo, choose **Open**.
5. In VS Code, choose **Terminal → New Terminal**. To use the launcher terminal instead, type `cd m1a0-CLASSCODE-USERNAME` with your actual repo folder name. In any other terminal, change into the full path of your cloned repo first.
6. Paste this check into the terminal.

```bash
git status --short --branch && git remote -v && git var GIT_AUTHOR_IDENT
```

The first line should show your branch. The fetch and push URLs should point to your private repo in **HAU-6ADET**. The last line should show your own name and commit email. If it shows someone else's details, return to the launcher terminal or the new VS Code window and check again. The command checks local wiring. A successful VS Code clone confirms read access, and a successful push confirms write access.

Use VS Code **Source Control** to commit and push on the lab computer. Check your new commit on GitHub before submitting its URL. At the end of class, sign out of GitHub in VS Code and the browser, close the lab window, and type `exit` in the launcher terminal. Your local files remain in the work folder.

Continue with the [activity instructions](README.md).
