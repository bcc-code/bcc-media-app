.PHONY: update-schema git-tag-recreate

BACKEND_SCHEMA_DIR=../brunstadtv/backend/graph/api/schema
APP_SCHEMA_DIR=./lib/graphql/schema
BUILD_NUMBER=$(shell grep -i -e "version: " pubspec.yaml | cut -d " " -f 2)
BUILD_NUMBER_KIDS=$(shell grep -i -e "version: " kids/pubspec.yaml | cut -d " " -f 2)

copy-schema: SHELL:=/bin/bash
copy-schema:
	for f in $(shell ls ${BACKEND_SCHEMA_DIR}) ;\
		do cp ${BACKEND_SCHEMA_DIR}/$$f "${APP_SCHEMA_DIR}/$${f%.graphqls}.graphql" ;\
	done

rm-locales:
	for file in $$(find ./lib/l10n/ -name *.arb -mindepth 1 -type f); do sed -i '' '/\@\@locale/d' $$file; done

web-build:
	flutter build web --release -t lib/main_prod.dart --web-renderer canvaskit

web-beta-upload:
	gsutil -m cp -R build/web/* gs://bccm-web-beta
	gsutil -m setmeta -r -h "Cache-control:no-cache, max-age=0" gs://bccm-web-beta/

# See https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-cli
changelog:
	standard-changelog -f -p conventionalcommits

# Release
release:
	git tag v${BUILD_NUMBER}${TAG_SUFFIX}
	git push --tags

release-kids-old:
	git tag v${BUILD_NUMBER}-kids
	git push --tags

release-kids:
	git tag v${BUILD_NUMBER_KIDS}-kids
	git push --tags

# Rerelease (recreate the release tag with a different commit)
# This can happen often, e.g. because you forgot to sync translations or a ci script needed to be fixed
rerelease:
	read -p "delete tag v${BUILD_NUMBER}${TAG_SUFFIX} (local and origin), and recreate it with current commit? (CTRL+C to abort)"
	git push --delete origin v${BUILD_NUMBER}${TAG_SUFFIX}
	git tag --delete v${BUILD_NUMBER}${TAG_SUFFIX}
	git tag v${BUILD_NUMBER}${TAG_SUFFIX}
	git push --tags

rerelease-kids-old:
	TAG_SUFFIX=-kids make rerelease

rerelease-kids:
	read -p "delete tag v${BUILD_NUMBER_KIDS}${TAG_SUFFIX} (local and origin), and recreate it with current commit? (CTRL+C to abort)"
	git push --delete origin v${BUILD_NUMBER_KIDS}${TAG_SUFFIX}
	git tag --delete v${BUILD_NUMBER_KIDS}${TAG_SUFFIX}
	git tag v${BUILD_NUMBER_KIDS}${TAG_SUFFIX}
	git push --tags