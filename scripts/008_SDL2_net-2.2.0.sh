VERSION=2.2.0
wget https://github.com/libsdl-org/SDL_net/releases/download/release-2.2.0/SDL2_net-$VERSION.tar.gz -O SDL2_net.tar.gz

## Unpack the source code.
rm -Rf SDL2_net && mkdir SDL2_net && tar --strip-components=1 --directory=SDL2_net -xvzf SDL2_net.tar.gz && cd SDL2_net

cp ../archives/config.sub ../archives/config.guess . || { exit 1; }

#cat ../patches/SDL2_net-$VERSION.patch | patch -p1 || { exit 1; }

#this is seems like a bug in (the version of) PSL1GHT/ps3toolchain
# (that I happen to have installed)
CFLAGS="$CFLAGS -I$PSL1GHT/ppu/include"
export CFLAGS

./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
    	|| { exit 1; }

make && make install || { exit 1; }
