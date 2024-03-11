IMAGE=hldtux/ps3dev-sdl2

test:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker run -i --rm -v "`pwd`:/src" -w /src ${IMAGE} ./make_SDL_Libs.sh

run:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker run -it --rm -v "`pwd`:/src" -w /src ${IMAGE} bash

clean:
	rm -rf build