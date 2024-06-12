"/Applications/Defold.app/Contents/Resources/packages/jdk-17.0.5+8/bin/java" -cp "/Applications/Defold.app/Contents/Resources/packages/defold-05791d87e2059524a11cbf946f47b6c87c6d1902.jar" "com.dynamo.bob.Bob" --variant debug --output build/zefold build
cp -rf build/arm64-osx/dmengine build/zefold/dmengine
chmod +x "build/zefold/dmengine"
build/zefold/dmengine
