#!/bin/sh
set -e

echo "1 Must run in your project root"
echo "2 installed python3   protoc > 3.0"

if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename $0) BAZEL_TARGET"
    exit 1
fi

#git clone https://github.com/lianghongkey/Bazel_and_CompileCommands.git ../Bazel_and_CompileCommands

bash ../Bazel_and_CompileCommands/setup_compile_commands.sh -f

bazel build --experimental_action_listener=//tools/actions:generate_compile_commands_listener $1
python3 ./tools/actions/generate_compile_commands_json.py

rm -rf ./tools/actions
rm -rf ./third_party/bazel/

echo "Genarate compile_commands.json"

exit 0
