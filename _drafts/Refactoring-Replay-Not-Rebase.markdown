---
title: "Refactoring: Replay, not Rebase"
layout: post
category : work
tags : [refactoring]
---

One of the fears I meet when suggesting code refactorings, is a fear of potential merge conflicts in a code.
When several developers work on different parts of the code base in parallel, and your refactoring also affects these parts, various conflicts may appear.
The same is also true when you work alone in different code branches and want to spread a refactoring along all of them.

![code changes](/images/refactoring-replay-not-rebase/code_changes.jpg)
