ios-setup:
	make ios-build
	xcrun simctl boot "iPhone 14" || ((xcrun simctl create "iPhone 14" "iPhone 14") && (xcrun simctl boot "iPhone 14"))
	make ios-install
ios-build:
	flutter build ios -t lib/main_prod.dart --flavor prod --debug --simulator
ios-install:
	xcrun simctl install Booted ../build/ios/iphonesimulator/Runner.app
ios-sim-reset:
	xcrun simctl shutdown all && xcrun simctl erase all
	xcrun simctl boot "iPhone 14" || ((xcrun simctl create "iPhone 14" "iPhone 14") && (xcrun simctl boot "iPhone 14"))

android-setup:
	make android-build
	make android-install
android-build:
	flutter build apk -t lib/main_prod.dart --flavor prod --debug
android-install:
	adb install ../build/app/outputs/flutter-apk/app-prod-debug.apk

current_time = $(shell date +%Y-%m-%d_%H-%M-%S)

test:
	maestro test --format junit --output reports/$(current_time).xml -e PLATFORM=${PLATFORM} flows/