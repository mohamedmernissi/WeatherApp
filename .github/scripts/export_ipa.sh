#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/WeatherApp.xcarchive \
            -exportOptionsPlist WeatherApp-iOS/WeatherApp\ iOS/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
