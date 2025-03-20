SOURCE_FILES := $(shell find . -type f -name '*.go')

policy.wasm: $(SOURCE_FILES) go.mod go.sum
	GOOS=wasip1 GOARCH=wasm go build -o policy.wasm

annotated-policy.wasm: policy.wasm metadata.yml
	kwctl annotate -m metadata.yml -u README.md -o annotated-policy.wasm policy.wasm

.PHONY: lint
lint:
	go vet ./...
	golangci-lint run

.PHONY: test
test:
	go test -v

.PHONY: clean
clean:
	go clean
	rm -f policy.wasm annotated-policy.wasm

.PHONY: e2e-tests
e2e-tests: annotated-policy.wasm
	bats e2e.bats
