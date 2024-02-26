mod-name := $(shell jq -r < info.json .name)
mod-version := $(shell jq -r < info.json .version)

src := $(shell fd . src)
extra-files := changelog.txt info.json LICENSE README.md thumbnail.png
out := $(patsubst src/%.fnl,out/build/%.lua,$(src))
extra-outputs :=  $(patsubst %,out/build/%,$(extra-files))
zip := out/$(mod-name)_$(mod-version).zip

.PHONY: all build clean package

all: $(zip)

build: $(out) $(extra-outputs)

clean:
	rm -rf out

package: $(zip)

$(extra-outputs): $(extra-files)
	cp $(extra-files) out/build

$(zip): $(out) $(extra-outputs)
	cd out; zip -r $(shell basename $(zip)) build

out/build/%.lua: src/%.fnl out/build
	fennel --compile $< > $@

out/build:
	mkdir -p out/build
