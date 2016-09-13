#!/bin/sh

xcodebuild -exportArchive -exportFormat ipa -archivePath ./${ARCHIVE_NAME_TO_EXPORT}.xcarchive -exportPath ./${ARCHIVE_NAME_TO_EXPORT}.ipa -exportProvisioningProfile "{$PROFILE_TO_USE}" CODE_SIGN_IDENTITY="${CERT_NAME}"

/Applications/Xcode.app/Contents/Applications/Application\ Loader.app/Contents/Frameworks/ITunesSoftwareService.framework/Support/altool --upload-app -u ${ITUNES_CONNECT_USER} -p ${ITUNES_CONNECT_PASSWORD} -f ${ARCHIVE_NAME_TO_EXPORT}.ipa

#If altool fails with
# altool[] *** Error: Exception while launching iTunesTransporter: Transporter not found at path: /usr/local/itms/bin/iTMSTransporter.  You should reinstall the application. 
# ln -s /Applications/Xcode.app/Contents/Applications/Application\ Loader.app/Contents/itms /usr/local/itms
#
