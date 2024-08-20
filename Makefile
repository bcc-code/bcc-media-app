.PHONY: update-schema git-tag-recreate changelog changelog-commit release release-kids rerelease rerelease-kids pubgetall main-branch web-build web-beta-upload fix-time bump crowdin-download crowdin-upload

BUILD_NUMBER=$(shell grep -i -e "version: " pubspec.yaml | cut -d " " -f 2)
BUILD_NUMBER_KIDS=$(shell grep -i -e "version: " kids/pubspec.yaml | cut -d " " -f 2)

# From https://stackoverflow.com/a/64996042
help:
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

pubgetall: ## Runs `flutter pub get` dependencies for all the flutter projects
	flutter pub get
	cd kids && flutter pub get
	cd submodules/bccm_flutter/bccm_core && flutter pub get
	cd submodules/bccm_player && flutter pub get

main-branch: ## Switches all submodules to the main branch
	@echo
	@git submodule foreach 'branch="$$(git config -f $$toplevel/.gitmodules submodule.$$name.branch)"; git switch $$branch; echo'

web-build: ## Builds the web version of the app
	flutter build web --release -t lib/main_prod.dart --web-renderer canvaskit

web-beta-upload: ## Uploads the web build to the beta bucket
	gsutil -m cp -R build/web/* gs://bccm-web-beta
	gsutil -m setmeta -r -h "Cache-control:no-cache, max-age=0" gs://bccm-web-beta/

# See https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/standard-changelog
changelog: ## Generates a changelog based on the commit messages
	standard-changelog -f -p conventionalcommits

changelog-commit: ## Generates a changelog and commits it
	@git diff-index --quiet HEAD -- || (echo "Working tree not clean, continue anyway? y/n" && read ans && [ $$ans == "y" ])
# temporary tag to include the version in the changelog
	git tag ${TAG}
	make changelog
	git add CHANGELOG.md
	git commit -m "chore: update changelog" || true
	git tag --delete ${TAG}

# Release
release: ## BCCM: Creates a release tag and pushes it
	TAG="v${BUILD_NUMBER}${TAG_SUFFIX}" make changelog-commit
	git tag v${BUILD_NUMBER}${TAG_SUFFIX}
	git push --tags

release-kids: ## KIDS: Creates a release tag and pushes it
	@TAG="v${BUILD_NUMBER_KIDS}-kids" make changelog-commit
	git tag v${BUILD_NUMBER_KIDS}-kids
	git push --tags

# Rerelease (recreate the release tag with a different commit)
# e.g. because you forgot to sync translations or a ci script needed to be fixed
rerelease: ## BCCM: Deletes the release tag and recreates it with the current commit
	@read -p "delete tag v${BUILD_NUMBER}${TAG_SUFFIX} (local and origin), and recreate it with current commit? (CTRL+C to abort)"
	git push --delete origin v${BUILD_NUMBER}${TAG_SUFFIX}
	git tag --delete v${BUILD_NUMBER}${TAG_SUFFIX}
	make changelog-commit
	git tag v${BUILD_NUMBER}${TAG_SUFFIX}
	git push --tags

rerelease-kids: ## KIDS: Deletes the release tag and recreates it with the current commit
	@read -p "delete tag v${BUILD_NUMBER_KIDS}-kids (local and origin), and recreate it with current commit? (CTRL+C to abort)"
	git push --delete origin v${BUILD_NUMBER_KIDS}-kids
	git tag --delete v${BUILD_NUMBER_KIDS}-kids
	make changelog-commit
	git tag v${BUILD_NUMBER_KIDS}-kids
	git push --tags

fix-time: ## Fixes the time on a connected android device. Useful e.g. if it has drifted and causes ssl errors
	adb shell "su 0 date `date +%m%d%H%M%Y.%S`"


# bumps the minor version in pubspec.yaml e.g. 0.4.5+45 -> 0.4.6+46
bump: ## Bumps the version in pubspec.yaml
	@VERSION_LINE=$$(grep -i -e "version: " pubspec.yaml); \
	CURRENT_VERSION=$$(echo $$VERSION_LINE | cut -d " " -f 2); \
	VERSION_PART=$$(echo $$CURRENT_VERSION | cut -d "+" -f 1); \
	BUILD_NUMBER=$$(echo $$CURRENT_VERSION | cut -d "+" -f 2); \
	IFS='.' read -r MAJOR MINOR PATCH <<< "$$VERSION_PART"; \
	NEW_VERSION="$${MAJOR}.$${MINOR}.$$((PATCH + 1))+$$(($$BUILD_NUMBER + 1))"; \
	sed -i '' "s/version: .*/version: $${NEW_VERSION}/" pubspec.yaml; \
	echo "Bumped version to $${NEW_VERSION}"
	git add pubspec.yaml
	git commit -m "chore: bump version to $${NEW_VERSION}"

crowdin-download: ## Download translations from crowdin and generate l10n files
	crowdin download --token=$$(cat .crowdin-token)
	flutter gen-l10n

crowdin-upload: ## Upload source strings to crowdin
	crowdin upload --token=$$(cat .crowdin-token)