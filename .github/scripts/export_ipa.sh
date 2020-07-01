#!/bin/bash

set -eo pipefail

#xcodebuild -archivePath $PWD/build/WeatherApp.xcarchive \
#            -exportOptionsPlist WeatherApp/exportOptions.plist \
#            -exportPath $PWD/build \
#            -allowProvisioningUpdates \
#            -exportArchive | xcpretty
xcodebuild  -exportArchive \
            -archivePath $PWD/build/WeatherApp.xcarchive \
            -exportOptionsPlist WeatherApp/exportOptions.plist \
            -exportPath DerivedData/ipa \
