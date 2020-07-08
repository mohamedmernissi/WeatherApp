##!/bin/sh
#
## Decrypt the files
## --batch to prevent interactive command --yes to assume "yes" for questions
#gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/WeatherApp_Distribution.mobileprovision.mobileprovision ./.github/secrets/WeatherApp_Distribution.mobileprovision.gpg
#
#gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg
#
#mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
#
#echo "List profiles"
#ls ~/Library/MobileDevice/Provisioning\ Profiles/
#echo "Move profiles"
#cp secrets/*.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/
#echo "List profiles"
#ls ~/Library/MobileDevice/Provisioning\ Profiles/
#
#security create-keychain -p "" build.keychain
#security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$IOS_KEYS" -A
#
#security list-keychains -s ~/Library/Keychains/build.keychain
#security default-keychain -s ~/Library/Keychains/build.keychain
#security unlock-keychain -p "" ~/Library/Keychains/build.keychain
#security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain

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
