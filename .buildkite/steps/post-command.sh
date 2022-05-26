echo "This is post-command script"

echo BUILDKITE_COMMAND_EXIT_STATUS $BUILDKITE_COMMAND_EXIT_STATUS

if [ $BUILDKITE_COMMAND_EXIT_STATUS -ne 0 ]; then
    echo "Steps are skipped because $BUILDKITE_AGENT_NAME:$BUILDKITE_LABEL returned $BUILDKITE_COMMAND_EXIT_STATUS" > .buildkite/script.sh
fi
