VERSION=2.22.0
wget https://github.com/libsdl-org/SDL_ttf/releases/download/release-$VERSION/SDL2_ttf-$VERSION.tar.gz -O SDL2_ttf.tar.gz

## Unpack the source code.
rm -Rf SDL2_ttf && mkdir SDL2_ttf && tar --strip-components=1 --directory=SDL2_ttf -xvzf SDL2_ttf.tar.gz && cd SDL2_ttf

cp ../archives/config.* . || { exit 1; }

./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--with-freetype-exec-prefix="$PS3DEV/portlibs/ppu" \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--without-x \
	--disable-sdltest \
	--disable-harfbuzz \
	--disable-shared \
	--enable-static \
    	|| { exit 1; }

make && make install || { exit 1; }
