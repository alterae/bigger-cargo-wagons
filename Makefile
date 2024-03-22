mod-name := $(shell jq -r < info.json .name)
mod-version := $(shell jq -r < info.json .version)

zip := out/$(mod-name)_$(mod-version).zip

.PHONY: all clean package

all: $(zip)

clean:
	rm -rf out

package: $(zip)


$(zip): out
	git archive --output="$(zip)" HEAD


out:
	mkdir -p out
