# bump-package-dep

Automatically sets and commits appropriate versions of package dependencies for Atom based on current package.json values.

## Installation

Prerequisite: `jq` [https://stedolan.github.io/jq/](https://stedolan.github.io/jq/) — Install it with Homebrew with `brew install jq`

If you have `~/bin` or similar on your path, you can do

```bash
curl -s https://raw.githubusercontent.com/BinaryMuse/bump-package-dep/master/bump-package-dep.sh -o ~/bin/bump-package-dep
chmod +x bump-package-dep
```

If you want to install it to `/usr/local/bin`, you can run:

```bash
curl https://raw.githubusercontent.com/BinaryMuse/bump-package-dep/master/bump-package-dep.sh -o /usr/local/bin/bump-package-dep
chmod +x /usr/local/bin/bump-package-dep
```

(This assumes that you have write access to `/usr/local/bin`)

## Example

Here, Atom is bundling tree-view v0.215.3, but we have v0.216.0 as the current version in tree-view's `package.json`:

```bash
$ jq '.packageDependencies."tree-view"' package.json
"0.215.3"
$ jq .version ~/github/tree-view/package.json
"0.216.0"
```

Let's update it!

```bash
$ bump-package-dep ~/github/tree-view
[master 0df0242bd] :arrow_up: tree-view@0.216.0
 1 file changed, 1 insertion(+), 1 deletion(-)
commit 0df0242bdd9155427732c483c0a568a9d782a9db (HEAD -> master)
Author: Michelle Tilley <binarymuse@github.com>
Date:   Wed Sep 20 15:11:54 2017 -0700

    :arrow_up: tree-view@0.216.0

diff --git a/package.json b/package.json
index 17a6ffede..0b745e8f6 100644
--- a/package.json
+++ b/package.json
@@ -131,7 +131,7 @@
     "symbols-view": "0.118.0",
     "tabs": "0.107.3",
     "timecop": "0.36.0",
-    "tree-view": "0.215.3",
+    "tree-view": "0.216.0",
     "update-package-dependencies": "0.12.0",
     "welcome": "0.36.5",
     "whitespace": "0.37.4",

>> Updated tree-view to 0.216.0! Don't forget to push
```
