#!/bin/bash

set -eo pipefail

xcodebuild -workspace WeatherApp.xcworkspace \
            -scheme WeatherApp \
            -sdk iphoneos \
            -allowProvisioningUpdates
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/WeatherApp.xcarchive \
            clean archive | xcpretty
