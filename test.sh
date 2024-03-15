#!/bin/bash -e

TEST_SCRIPTS=(./sdl_psl1ght.sh ./sdl2_psl1ght.sh ./make_SDL_Libs.sh)
for SCRIPT in $TEST_SCRIPTS; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done