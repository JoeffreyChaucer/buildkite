#!/bin/bash
set -euo pipefail

echo $BUILDKITE_PULL_REQUEST_BASE_BRANCH
echo $BUILDKITE_COMMIT


git diff --stat $BUILDKITE_PULL_REQUEST_BASE_BRANCH...$BUILDKITE_COMMIT


if ! git diff --name-only $BUILDKITE_PULL_REQUEST_BASE_BRANCH...$BUILDKITE_COMMIT | grep -qvE '(*.md)'
then
    echo "Only docs were updated, not running the CI."
    exit 0
fi


if [[ -n "$FIRST_STEP" ]]; then
    rm -f .buildkite/pipeline.yml || true
    exit 0
fi

if [[ -f ".buildkite/pipeline.yml" ]]; then
    SKIP_STEPS=$(cat .buildkite/pipeline.yml)
    export SKIP_STEPS
    echo SKIP_STEPS: $SKIP_STEPS
    exit 1
fi
