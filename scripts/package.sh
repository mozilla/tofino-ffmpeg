mkdir -p dist

if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
  cp ffmpeg/${target_arch}/*.dylib dist
  platform="darwin"
else
  cp ffmpeg/${target_arch}/lib.target/*.so dist
  platform=${TRAVIS_OS_NAME}
fi

cd dist
zip -r9 ../ffmpeg-${platform}-${target_arch}.zip *
