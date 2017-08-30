#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="master"

function generate {
    php bin/sculpin generate --env=prod
}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy; just doing a build."
    generate
    exit 0
fi

# Save some useful information
REPO="https://github.com/dloranc/dloranc.github.io.git"
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Clone the existing master for this repo into output_prod/
# Create a new empty branch if master doesn't exist yet (should only happen on first deply)
git clone $REPO output_prod/
cd output_prod/
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH

# Clean out existing contents
find * -maxdepth 0 -name '.git' -prune -o -exec rm -rf '{}' ';' || exit 0
cd ..

# Run our compile script
generate

# Now let's go have some fun with the cloned repo
cd output_prod
git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# If there are no changes to the compiled output_prod (e.g. this is a README update) then just bail.
if git diff --quiet; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
git add -A .
git commit -m "Deploy to GitHub Pages: ${SHA}"

chmod 600 ../deploy_key
eval `ssh-agent -s`
ssh-add ../deploy_key

# Now that we're all set up, we can push.
git push $SSH_REPO $TARGET_BRANCH
