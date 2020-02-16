sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
pkg update && pkg upgrade
pkg install util-linux clang llvm vim nano openssh wget autoconf automake bison bzip2 cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl readline sed silversearcher-ag tar clang python fftw libzmq  freetype libpng libjpeg-turbo glib pkg-config zlib

curl -L https://its-pointless.github.io/setup-pointless-repo.sh | sh
pkg install scipy -y
pkg-config --cflags freetype2

pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install jupyter sympy control networkx

LDFLAGS=" -lm -lcompiler_rt" pip install cython
LDFLAGS="-L/system/lib/ -lm -lcompiler_rt" pip install Pillow --global-option="build_ext"
LDFLAGS=" -lm -lcompiler_rt" pip install matplotlib
LDFLAGS=" -lm -lcompiler_rt" pip install pandas

pip uninstall joblib -y
pip install joblib==0.11
NPY_NUM_BUILD_JOBS=1 pip install scikit-learn
