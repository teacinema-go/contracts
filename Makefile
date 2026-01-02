PROTO_DIR = proto
GEN_GO_DIR = gen/go

PROTO_FILES = $(shell find $(PROTO_DIR) -name "*.proto")

.PHONY: gen
gen:
	@echo "Generating Go code from proto files..."
	@mkdir -p $(GEN_GO_DIR)
	protoc \
		--proto_path=$(PROTO_DIR) \
		--go_out=$(GEN_GO_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_GO_DIR) \
		--go-grpc_opt=paths=source_relative \
		$(PROTO_FILES)
	@echo "Generation complete!"