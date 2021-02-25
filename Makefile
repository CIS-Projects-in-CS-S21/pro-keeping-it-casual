.DEFAULT_GOAL := generate_protos

BUILDER_VERSION=1.0.0

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

generate_protos:
	docker run --rm -v $(current_dir):/defs gcr.io/keeping-it-casual/proto-compiler:$(BUILDER_VERSION)
	docker run --rm -v $(current_dir):/defs gcr.io/keeping-it-casual/proto-compiler:$(BUILDER_VERSION) build -o gen/image.bin

build_builder_image:
	docker build -t gcr.io/keeping-it-casual/proto-compiler:$(BUILDER_VERSION) .

push_builder_image: build_builder_image
	docker push gcr.io/keeping-it-casual/proto-compiler:$(BUILDER_VERSION)