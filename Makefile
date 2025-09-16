all: zip

lint: clean
	@tools/yaml2json --lint ./yaml ./json

zip: json
	@cp -v LICENSE ./json/
	@zip -j rst-idn-test-labels.zip json/*

json:
	@tools/yaml2json ./yaml ./json

clean:
	@rm -rf ./json rst-idn-test-labels.zip
