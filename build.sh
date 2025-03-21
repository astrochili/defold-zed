set -e

task=$1
"/Applications/Defold.app/Contents/Resources/packages/jdk-21.0.5+11/bin/java" -cp "/Applications/Defold.app/Contents/Resources/packages/defold-a9247e38b24ba1c1ed5913c4049d9a4083a314a7.jar" "com.dynamo.bob.Bob" --variant debug --output build/zefold --binary-output build/zefold $task

if [ $task = "build" ]
then
  cp -rf build/zefold/arm64-osx/dmengine build/zefold/dmengine
  chmod +x "build/zefold/dmengine"
  build/zefold/dmengine
fi
