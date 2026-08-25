target:
	echo "targets: init, build-m1n1, build-installer, release"

init:
	git submodule update --init --recursive --depth 1

build-m1n1:
	CARGO_NET_GIT_FETCH_WITH_CLI=true TOOLCHAIN= ARCH=aarch64-linux-gnu- RELEASE=1 CHAINLOADING=1 make -C m1n1 -j$$(nproc)

build-installer:
	cd installer && ./scripts/build-local.sh

release: build-m1n1 build-installer
	cd installer && VER=$$(cat releases/latest) gh release create "omnux-$$VER" "releases/installer-$$VER.tar.gz" "releases/SHA256SUMS" --title "Omnux installer $$VER" --generate-notes
