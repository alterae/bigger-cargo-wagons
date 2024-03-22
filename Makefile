mod-name := $(shell jq -r < info.json .name)
mod-version := $(shell jq -r < info.json .version)
mod-string := $(mod-name)_$(mod-version)

zip := out/$(mod-string).zip

.PHONY: all clean package

all: $(zip)

clean:
	rm -rf out

package: $(zip)

$(zip): out
	git archive --output="$(zip)" --prefix="$(mod-string)/" HEAD

out:
	mkdir -p out
