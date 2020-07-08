#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" --output ./.github/secrets/WeatherApp_Distribution.mobileprovision.mobileprovision ./.github/secrets/WeatherApp_Distribution.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$PROVISIONING_PASSWORD" --output ./.github/secrets/Certificats.p12 ./.github/secrets/Certificats.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/WeatherApp_Distribution.mobileprovision.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/WeatherApp_Distribution.mobileprovision.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificats.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
