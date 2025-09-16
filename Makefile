all: json license

json:
	@tools/yaml2json ./yaml ./json

license:
	@cp LICENSE ./json/

clean:
	@rm -rf ./json
