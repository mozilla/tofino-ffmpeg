if [ "${TRAVIS_OS_NAME}" == "osx" ]; then
  brew install yasm
else
  sudo apt-get -y -q install yasm
fi

if [ "${ARCH}" == "x86" ]; then
  target_arch="ia32"
else
  target_arch="${ARCH}"
fi

echo "Building for ${TRAVIS_OS_NAME} ${target_arch}"

export target_arch
