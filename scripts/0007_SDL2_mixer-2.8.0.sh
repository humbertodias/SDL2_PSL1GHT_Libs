VERSION=2.8.0
./download.sh http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-$VERSION.tar.gz || { exit 1; }

tar xfvz archives/SDL2_mixer-$VERSION.tar.gz || { exit 1; }

cd SDL2_mixer-$VERSION || { exit 1; }

cp ../archives/config.sub ../archives/config.guess build-scripts/ || { exit 1; }

#cat ../patches/SDL2_mixer-$VERSION.patch | patch -p1 || { exit 1; }

LIBMIKMOD_CONFIG="$PS3DEV/portlibs/ppu/bin/libmikmod-config"
export LIBMIKMOD_CONFIG
./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	--disable-music-cmd \
	--disable-music-ogg-shared \
	--disable-music-mp3 \
	--disable-music-flac \
    	|| { exit 1; }

make && make install || { exit 1; }
