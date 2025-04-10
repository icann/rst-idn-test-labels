# this .env file should contain SRC_DIR=/path/to/source/directory
include .env

all:
	@tools/yaml2json $(SRC_DIR) ./json
	@mv -fv ./json/*.yaml ./yaml/
