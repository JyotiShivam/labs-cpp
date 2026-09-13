#!/bin/bash

set -e

BRANCH="skelton"

echo "==> Fetching latest main..."
git fetch origin

echo "==> Switching to $BRANCH..."
git checkout "$BRANCH"

echo "==> Rebasing $BRANCH onto origin/main..."
if ! git rebase origin/main; then
    echo ""
    echo "❌ Rebase stopped because of conflicts."
    echo "Resolve the conflicts, then run:"
    echo "    git add ."
    echo "    git rebase --continue"
    echo ""
    echo "After the rebase finishes, push with:"
    echo "    git push --force-with-lease --set-upstream origin $BRANCH"
    exit 1
fi

echo "==> Pushing..."
git push --force-with-lease --set-upstream origin "$BRANCH"

echo ""
echo "✅ Done! $BRANCH is rebased onto the latest main."