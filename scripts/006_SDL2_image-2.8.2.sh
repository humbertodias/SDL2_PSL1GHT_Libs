VERSION=2.8.2
wget https://github.com/libsdl-org/SDL_image/releases/download/release-$VERSION/SDL2_image-$VERSION.tar.gz -O SDL2_image.tar.gz

## Unpack the source code.
rm -Rf SDL2_image && mkdir SDL2_image && tar --strip-components=1 --directory=SDL2_image -xvzf SDL2_image.tar.gz

## Create the build directory.
cd SDL2_image

cp ../archives/config.* . || { exit 1; }

# cat ../patches/SDL_image-2.8.2.patch | patch -p1 || { exit 1; }
# \

./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	--disable-tif \
	--disable-webp \
	--enable-static \
	SDL_CFLAGS="`$PS3DEV/portlibs/ppu/bin/sdl2-config --cflags`" \
	LIBPNG_CFLAGS="`$PS3DEV/portlibs/ppu/bin/libpng-config --cflags`" \
	LIBPNG_LIBS="`$PS3DEV/portlibs/ppu/bin/libpng-config --libs`" \
    	|| { exit 1; }

make && make install || { exit 1; }
