wget https://github.com/humbertodias/SDL2_gfx/tarball/main -O SDL2_gfx.tar.gz

## Unpack the source code.
rm -Rf SDL2_gfx && mkdir SDL2_gfx && tar --strip-components=1 --directory=SDL2_gfx -xvzf SDL2_gfx.tar.gz

## Create the build directory.
cd SDL2_gfx

## Required resource
ln -s README.md README

./autogen.sh
./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-sdltest \
	--disable-mmx \
	--disable-shared \
	--enable-static \
    	|| { exit 1; }

aclocal_kluge='am__aclocal_m4_deps='
make $aclocal_kluge && make $aclocal_kluge install || { exit 1; }
