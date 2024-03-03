VERSION=2.8.2
./download.sh SDL2_image-$VERSION.tar.gz || { exit 1; }

tar xfvz archives/SDL2_image-$VERSION.tar.gz || { exit 1; }

cd SDL2_image-$VERSION || { exit 1; }

cp ../archives/config.sub ../archives/config.guess . || { exit 1; }

# cat ../patches/SDL_image-2.8.2.patch | patch -p1 || { exit 1; }
# \
./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	SDL2_CONFIG="`$PSL1GHT/sdl2-config --cflags --libs`" \
	LIBPNG_CFLAGS="`$PS3DEV/portlibs/ppu/bin/libpng-config --cflags`" \
	LIBPNG_LIBS="`$PS3DEV/portlibs/ppu/bin/libpng-config --libs`" \
    	|| { exit 1; }

make && make install || { exit 1; }
