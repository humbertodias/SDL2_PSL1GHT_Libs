VERSION=1.2.7
./download.sh SDL_net-$VERSION.tar.gz || { exit 1; }

tar xfvz archives/SDL_net-$VERSION.tar.gz || { exit 1; }

cd SDL_net-$VERSION || { exit 1; }

cp ../archives/config.sub ../archives/config.guess . || { exit 1; }

cat ../patches/SDL_net-$VERSION.patch | patch -p1 || { exit 1; }

#this is seems like a bug in (the version of) PSL1GHT/ps3toolchain
# (that I happen to have installed)
CFLAGS="$CFLAGS -I$PSL1GHT/ppu/include"
export CFLAGS

./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	--enable-static \
    	|| { exit 1; }

make && make install || { exit 1; }
