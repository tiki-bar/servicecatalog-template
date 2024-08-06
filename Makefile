.PHONY: build

NAME := servicecatalog-template
BUCKET := tiki-artifacts-catalog
TEMPLATE_FILE := template.yml
PACKAGED_FILE := packaged-template.yml

build:
	sam build

publish: build
	sam package --template-file $(TEMPLATE_FILE) --s3-bucket $(BUCKET) --s3-prefix $(NAME) --output-template-file $(PACKAGED_FILE)
	aws s3 mv $(PACKAGED_FILE) "s3://$(BUCKET)/$(NAME)/$(PACKAGED_FILE)"
	aws servicecatalog create-provisioning-artifact \
        --product-id $(PRODUCT_ID) \
        --parameters '{"Name":"$(VERSION)","Type": "CLOUD_FORMATION_TEMPLATE","Info":{"LoadTemplateFromURL":"https://s3.amazonaws.com/$(BUCKET)/$(NAME)/$(PACKAGED_FILE)"}}';
