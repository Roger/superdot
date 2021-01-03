make-dirs:
	# mkdir -p {lib,bin}/aarch64-linux-android
	# mkdir -p {lib,bin}/armv7-linux-androideabi
	# mkdir -p {lib,bin}/i686-linux-android
	# mkdir -p {lib,bin}/i686-unknown-linux-gnu
	# mkdir -p {lib,bin}/x86_64-linux-android
	# mkdir -p {lib,bin}/x86_64-pc-windows-gnu
	mkdir -p {lib,bin}/x86_64-unknown-linux-gnu

build-debug: make-dirs
	# make build-aarch64-linux-android-debug
	# make build-armv7-linux-androideabi-debug
	# make build-i686-linux-android-debug
	# make build-x86_64-linux-android-debug
	# make build-i686-unknown-linux-gnu-debug
	make build-x86_64-unknown-linux-gnu-debug

build-release: make-dirs
	# make build-aarch64-linux-android-release
	# make build-armv7-linux-androideabi-release
	# make build-i686-linux-android-release
	# make build-x86_64-linux-android-release
	# make build-i686-unknown-linux-gnu-release
	make build-x86_64-unknown-linux-gnu-release

export-debug: make-dirs
	# make export-aarch64-linux-android-debug
	# make export-armv7-linux-androideabi-debug
	# make export-i686-linux-android-debug
	# make export-x86_64-linux-android-debug
	# make export-i686-unknown-linux-gnu-debug
	make export-x86_64-unknown-linux-gnu-debug

export-release: make-dirs
	# make export-aarch64-linux-android-release
	# make export-armv7-linux-androideabi-release
	# make export-i686-linux-android-release
	# make export-x86_64-linux-android-release
	# make export-i686-unknown-linux-gnu-release
	make export-x86_64-unknown-linux-gnu-release

build-aarch64-linux-android-debug:
	cargo build --target aarch64-linux-android 
	cp -b ./target/aarch64-linux-android/debug/*.so ./lib/aarch64-linux-android

export-aarch64-linux-android-debug: build-aarch64-linux-android-debug
	cd godot/ ; godot --export-debug "Android.aarch64-linux-android.debug" ../bin/aarch64-linux-android/superdot.debug.aarch64-linux-android.apk

build-aarch64-linux-android-release:
	cargo build --target aarch64-linux-android --release
	cp -b ./target/aarch64-linux-android/release/*.so ./lib/aarch64-linux-android

export-aarch64-linux-android-release: build-aarch64-linux-android-release
	cd godot/ ; godot --export "Android.aarch64-linux-android.release" ../bin/aarch64-linux-android/superdot.release.aarch64-linux-android.apk

build-armv7-linux-androideabi-debug:
	cargo build --target armv7-linux-androideabi 
	cp -b ./target/armv7-linux-androideabi/debug/*.so ./lib/armv7-linux-androideabi

export-armv7-linux-androideabi-debug: build-armv7-linux-androideabi-debug
	cd godot/ ; godot --export-debug "Android.armv7-linux-androideabi.debug" ../bin/armv7-linux-androideabi/superdot.debug.armv7-linux-androideabi.apk

build-armv7-linux-androideabi-release:
	cargo build --target armv7-linux-androideabi --release
	cp -b ./target/armv7-linux-androideabi/release/*.so ./lib/armv7-linux-androideabi

export-armv7-linux-androideabi-release: build-armv7-linux-androideabi-release
	cd godot/ ; godot --export "Android.armv7-linux-androideabi.release" ../bin/armv7-linux-androideabi/superdot.release.armv7-linux-androideabi.apk

build-i686-linux-android-debug:
	cargo build --target i686-linux-android 
	cp -b ./target/i686-linux-android/debug/*.so ./lib/i686-linux-android

export-i686-linux-android-debug: build-i686-linux-android-debug
	cd godot/ ; godot --export-debug "Android.i686-linux-android.debug" ../bin/i686-linux-android/superdot.debug.i686-linux-android.apk

build-i686-linux-android-release:
	cargo build --target i686-linux-android --release
	cp -b ./target/i686-linux-android/release/*.so ./lib/i686-linux-android

export-i686-linux-android-release: build-i686-linux-android-release
	cd godot/ ; godot --export "Android.i686-linux-android.release" ../bin/i686-linux-android/superdot.release.i686-linux-android.apk

build-x86_64-linux-android-debug:
	cargo build --target x86_64-linux-android 
	cp -b ./target/x86_64-linux-android/debug/*.so ./lib/x86_64-linux-android

export-x86_64-linux-android-debug: build-x86_64-linux-android-debug
	cd godot/ ; godot --export-debug "Android.x86_64-linux-android.debug" ../bin/x86_64-linux-android/superdot.debug.x86_64-linux-android.apk

build-x86_64-linux-android-release:
	cargo build --target x86_64-linux-android --release
	cp -b ./target/x86_64-linux-android/release/*.so ./lib/x86_64-linux-android

export-x86_64-linux-android-release: build-x86_64-linux-android-release
	cd godot/ ; godot --export "Android.x86_64-linux-android.release" ../bin/x86_64-linux-android/superdot.release.x86_64-linux-android.apk

build-i686-unknown-linux-gnu-debug:
	cargo build --target i686-unknown-linux-gnu 
	cp -b ./target/i686-unknown-linux-gnu/debug/*.so ./lib/i686-unknown-linux-gnu

export-i686-unknown-linux-gnu-debug: build-i686-unknown-linux-gnu-debug
	cd godot/ ; godot --export-debug "Linux/X11.i686-unknown-linux-gnu.debug" ../bin/i686-unknown-linux-gnu/superdot.debug.i686-unknown-linux-gnu

build-i686-unknown-linux-gnu-release:
	cargo build --target i686-unknown-linux-gnu --release
	cp -b ./target/i686-unknown-linux-gnu/release/*.so ./lib/i686-unknown-linux-gnu

export-i686-unknown-linux-gnu-release: build-i686-unknown-linux-gnu-release
	cd godot/ ; godot --export "Linux/X11.i686-unknown-linux-gnu.release" ../bin/i686-unknown-linux-gnu/superdot.release.i686-unknown-linux-gnu

# TODO: assume we are developing in linux x86_64
build-x86_64-unknown-linux-gnu-debug:
	cargo build
	cp -b ./target/debug/*.so ./lib/x86_64-unknown-linux-gnu

export-x86_64-unknown-linux-gnu-debug: build-x86_64-unknown-linux-gnu-debug
	cd godot/ ; godot --export-debug "Linux/X11.x86_64-unknown-linux-gnu.debug" ../bin/x86_64-unknown-linux-gnu/superdot.debug.x86_64-unknown-linux-gnu

build-x86_64-unknown-linux-gnu-release:
	cargo build --target x86_64-unknown-linux-gnu --release
	cp -b ./target/x86_64-unknown-linux-gnu/release/*.so ./lib/x86_64-unknown-linux-gnu

export-x86_64-unknown-linux-gnu-release: build-x86_64-unknown-linux-gnu-release
	cd godot/ ; godot --export "Linux/X11.x86_64-unknown-linux-gnu.release" ../bin/x86_64-unknown-linux-gnu/superdot.release.x86_64-unknown-linux-gnu

# Windows
build-x86_64-pc-windows-gnu-debug:
	cargo build --target x86_64-pc-windows-gnu
	cp -b ./target/x86_64-pc-windows-gnu/debug/*.dll ./lib/x86_64-pc-windows-gnu

export-x86_64-pc-windows-gnu-debug: build-x86_64-pc-windows-gnu-debug
	cd godot/ ; godot --export-debug "Windows Desktop" ../bin/x86_64-pc-windows-gnu/superdot.debug.x86_64-pc-windows-gnu.exe

build-x86_64-pc-windows-gnu-release:
	cargo build --target x86_64-pc-windows-gnu --release
	cp -b ./target/x86_64-pc-windows-gnu/release/*.dll ./lib/x86_64-pc-windows-gnu

export-x86_64-pc-windows-gnu-release: build-x86_64-pc-windows-gnu-release
	cd godot/ ; godot --export "Windows Desktop" ../bin/x86_64-pc-windows-gnu/superdot.release.x86_64-pc-windows-gnu.exe

audit:
	cargo-audit audit

check:
	cargo check

clean:
	cargo clean
	
watch:
	cargo watch -w rust/ -s "make build-x86_64-unknown-linux-gnu-debug"

create-debug-keystore:
	keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore superdot.debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999 -deststoretype pkcs12

create-release-keystore:
	keytool -v -genkey -v -keystore superdot.release.keystore -alias superdot -keyalg RSA -validity 10000

doc:
	cargo doc --no-deps --open -v

edit:
	# ${EDITOR} rust/src/lib.rs &
	godot --path godot/ -e &

run:
	make build-x86_64-unknown-linux-gnu-debug
	godot --path godot/ -d

nix-shell:
	nix-shell --pure

test:
	cargo test
