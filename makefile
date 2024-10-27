DOCKERARGS = docker run -it --rm -v $(shell pwd):/workdir
DOCKERIMG_CROSS = builder1.lab:5000/psubuilder-cross:2.3.1

DOCKER_CROSS = $(DOCKERARGS) $(DOCKERIMG_CROSS)

build:
	sh autogen.sh && ./configure && make install

host-build:
	$(DOCKER_CROSS) bash -c "$(MAKE) build"