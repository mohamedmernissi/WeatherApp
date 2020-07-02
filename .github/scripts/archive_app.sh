#!/bin/bash

set -eo pipefail

xcodebuild  -workspace WeatherApp.xcworkspace \
            -scheme "WeatherApp" \
            -sdk iphonesimulator \
#            -destination "platform=iOS Simulator,name=iPhone 11" \#
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/WeatherApp.xcarchive \
            clean archive | xcpretty
