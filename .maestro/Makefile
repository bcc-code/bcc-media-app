.PHONY: notifications test debug

ios-setup:
	make ios-build
	make ios-sim || true
	make ios-install
ios-build:
	flutter build ios -t lib/main_prod.dart --flavor prod --debug --simulator --dart-define=IS_MAESTRO_TEST=true 
ios-install:
	xcrun simctl install Booted ../build/ios/iphonesimulator/Runner.app
ios-sim-reset:
	xcrun simctl shutdown all && xcrun simctl erase all
	make ios-sim
ios-sim:
	xcrun simctl boot "iPhone 14" || ((xcrun simctl create "iPhone 14" "iPhone 14") && (xcrun simctl boot "iPhone 14"))

android-setup:
	make android-build
	make android-install
android-build:
	flutter build apk -t lib/main_prod.dart --flavor prod --debug --dart-define=IS_MAESTRO_TEST=true
android-install:
	adb install ../build/app/outputs/flutter-apk/app-prod-debug.apk

current_time = $(shell date +%Y-%m-%d_%H-%M-%S)
flow = $(if $(FLOW),$(FLOW),)
platform = $(if $(PLATFORM),$(PLATFORM),ios)

notifications:
	./notifications/push_ios.sh

test:
	mkdir -p reports
	make notifications
	maestro test --format junit --output reports/$(current_time).xml -e PLATFORM=${PLATFORM} flows/${flow}

debug:
	maestro test -c -e PLATFORM=${platform} flows/${flow}