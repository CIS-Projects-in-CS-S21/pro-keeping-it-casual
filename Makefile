.DEFAULT_GOAL := generate_protos

PROTO_COMPILER_VERSION=v0.3.0

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

generate_protos:
	docker run --rm -v $(current_dir):/defs gcr.io/rowan-senior-project/proto-compiler:$(PROTO_COMPILER_VERSION)
	docker run --rm -v $(current_dir):/defs gcr.io/rowan-senior-project/proto-compiler:$(PROTO_COMPILER_VERSION) build -o gen/image.bin


build_builder_image:
	docker build -t gcr.io/rowan-senior-project/proto-compiler:$(V) .

push_builder_image: build_builder_image
	docker push gcr.io/rowan-senior-project/proto-compiler:$(V)