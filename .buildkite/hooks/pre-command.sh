echo FIRST_STEP: YES

if [[ -n "$FIRST_STEP" ]]; then
    rm -f .buildkite/script.sh || true
    exit 0
fi

if [[ -f ".buildkite/script.sh" ]]; then
    SKIP_STEPS=$(cat .buildkite/script.sh)
    export SKIP_STEPS
    echo SKIP_STEPS: $SKIP_STEPS
    exit 1
fi
