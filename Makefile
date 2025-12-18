all: zip

lint: clean
	@echo linting YAML files...
	@find yaml/ -type d -mindepth 1 -maxdepth 1 -print -exec tools/yaml2json --lint {} \;

zip: json
	@echo creating zip file...
	@cp -v LICENSE ./json/
	@cd json ; zip -r ../rst-idn-test-labels.zip *

json: clean
	@echo creating JSON files...
	@mkdir json
	@find yaml/ -type d -mindepth 1 -maxdepth 1 -exec basename {} \; | xargs -n1 -I % tools/yaml2json yaml/% json/%

clean:
	@echo cleaning...
	@rm -rfv ./json rst-idn-test-labels.zip
