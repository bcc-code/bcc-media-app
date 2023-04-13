.PHONY: update-schema git-tag-recreate

BACKEND_SCHEMA_DIR=../brunstadtv/backend/graph/api/schema
APP_SCHEMA_DIR=./lib/graphql/schema
BUILD_NUMBER=$(shell grep -i -e "version: " pubspec.yaml | cut -d " " -f 2)
copy-schema: SHELL:=/bin/bash
copy-schema:
	for f in $(shell ls ${BACKEND_SCHEMA_DIR}) ;\
		do cp ${BACKEND_SCHEMA_DIR}/$$f "${APP_SCHEMA_DIR}/$${f%.graphqls}.graphql" ;\
	done


rm-locales:
	for file in $$(find ./lib/l10n/ -name *.arb -mindepth 1 -type f); do sed -i '' '/\@\@locale/d' $$file; done

test-ios:
	cd ios && xcodebuild test \
	-workspace Runner.xcworkspace \
	-scheme prod \
	-xcconfig Flutter/Debug.xcconfig \
	-configuration Debug-prod \
	-sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 14" \
	OTHER_SWIFT_FLAGS='$(inherited) -D PATROL_ENABLED'

test-android:
	patrol test --target integration_test/main_test.dart --flavor prod --verbose --scheme prod --xcconfig Flutter/Debug.xcconfig

git-tag-recreate:
	echo ${BUILD_NUMBER}
	read -p "continue?"
	git push --delete origin ${BUILD_NUMBER}
	git tag --delete ${BUILD_NUMBER}
	git tag ${BUILD_NUMBER}
	git push --tags