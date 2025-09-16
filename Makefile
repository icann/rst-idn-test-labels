all: zip

zip: json license
	@cp -v LICENSE ./json/
	@zip -j rst-idn-test-labels.zip json/*

json:
	@tools/yaml2json ./yaml ./json

clean:
	@rm -rf ./json rst-idn-test-labels.zip
