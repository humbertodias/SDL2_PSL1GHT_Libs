#!/bin/sh -e
# sdl_psl1ght.sh by Humberto Dias

## Download the source code.
# SDL1
wget https://github.com/zeldin/SDL_PSL1GHT/tarball/master -O sdl_psl1ght.tar.gz

## Unpack the source code.
rm -Rf sdl_psl1ght && mkdir sdl_psl1ght && tar --strip-components=1 --directory=sdl_psl1ght -xvzf sdl_psl1ght.tar.gz

## Create the build directory.
cd sdl_psl1ght

## Compile and install.
./script.sh && ${MAKE:-make} && ${MAKE:-make} install

# Copy sdl-config to PATH
cp sdl-config $PS3DEV/portlibs/ppu/bin