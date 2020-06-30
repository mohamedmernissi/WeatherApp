#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/WeatherApp_Distribution.mobileprovision ./.github/secrets/WeatherApp_Distribution.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/mohamedmernissi_distribution.cer ./.github/secrets/mohamedmernissi_distribution.cer.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/WeatherApp_Distribution.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/WeatherApp_Distribution.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/mohamedmernissi_distribution.cer -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
