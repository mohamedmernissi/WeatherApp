#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/Calculator.xcarchive \
            -exportOptionsPlist WeatherApp/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
