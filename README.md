# 👋 M1A0: Hello World

[![Made with Codex](https://img.shields.io/badge/Made_with-Codex-D97757?logo=anthropic&logoColor=white)](https://tjakoen.github.io/notes/ten-times-zero)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2?logo=dart&logoColor=white)

Your first ADET activity is small on purpose: run a Dart program, save it in GitHub, and submit the exact version you finished. By the end, you should know that your tools and your submission path work.

## Before you start

Follow the [setup guide](SETUP.md) to create and clone your private activity repo and check Git.

## 1. Complete Hello World

Install the activity's dependencies:

```sh
dart pub get
```

Open bin/hello.dart. Inside main(), write a statement that prints exactly this greeting on one line:

```text
Hello, World!
```

The comma, capital letters and exclamation mark matter. Run the program:

```sh
dart run bin/hello.dart
```

In your private copy, fill in student.json with your name, student number, school email, class code and GitHub username. Use the same verified identity for the course. Keep all values as text, including the student number and class code. Enter the lab room in `room` and the computer number printed on your station in `pcNumber`. Use text values such as `"MGN-202"` and `"07"`. Both fields are required by the tests.

## 2. Check and save your work

```sh
dart analyze
dart test
```

The checks cover the greeting and your required identity fields. They fail on the untouched starter because both are intentionally blank. Fix your program and details; do not edit the tests to make them pass. A green student-side check is useful feedback; the instructor grades from trusted course checks.

Review your changes before committing. Only the activity files belong here; never commit credentials or unrelated personal files.

```sh
git status
git add bin/hello.dart student.json README.md pubspec.yaml pubspec.lock SOURCES-AND-ASSISTANCE.md
git commit -m "Complete M1A0 Hello World"
```

In VS Code, open **Source Control** and choose **Push**. Check that the commit appears on GitHub.

## 3. Submit the exact commit link in Canvas

A push saves your work. You still need to submit it:

1. Open your private M1A0 repository on GitHub.
2. Open its commit history and select the commit containing your finished work.
3. Copy that commit page's full URL. It contains **/commit/** followed by the full commit identifier.
4. Open **M1A0 in your own Canvas course** and submit that link using the Website URL option.
5. Reopen the Canvas assignment and verify that your submitted link points to the intended commit.

Submit the commit page, rather than the repository home page, a branch link, or a screenshot. The instructor needs access to the repository. Your repository stays private; report an access problem instead of making it public. If you revise your work, submit the new commit link through Canvas while the assignment allows resubmission. A later push does not change the commit you already submitted.

The Canvas assignment, deadline and points will be announced in your class. This public template does not create a Canvas assignment or set a score. The current week-one route is a direct Canvas URL submission; you do not need to submit again through Course Platform.

## Sources and assistance

Follow the rules in the activity brief and the instructor's AI policy. Use permitted help to understand setup, syntax and errors, then test and explain your own submission. Ask the instructor first if permission is unclear. Never share credentials, personal information or another student's private work with a tool.

Complete [SOURCES-AND-ASSISTANCE.md](SOURCES-AND-ASSISTANCE.md) in your private copy. Describe the help you used and credit any applicable sources. Commit the file with your activity.

## If something fails

Tell the instructor which step failed, what the error says, and what you tried. Share private links through the course's approved channel. Do not post your student details or credentials in this public repository's issues.

---
🤖 **Built with Codex. I don't prompt and pray, I prompt and prove.** Every commit here is co-authored with an AI, on purpose. [How I actually work with AI, receipts and all →](https://tjakoen.github.io/notes/ten-times-zero)
