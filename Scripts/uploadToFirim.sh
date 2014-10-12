#/bin/sh
# Update: 2014-06-24
# Author: YoungShook

# compress application.
if [ "${CONFIGURATION}" = "Release" ]; then


#Clear
LOG="/tmp/firim.log"
/bin/rm "/tmp/firim.log"
/bin/rm "/tmp/${PRODUCT_NAME}.ipa"

#==========Define=====================================================================================================================

#set char type 
export LC_CTYPE=en_US.UTF-8

# Local Display App Name And Default Icon@2x.png ------------ need developer custom
ICON_NAME="AppIcon60x60@2x.png"

#Define
token="z8M5VQgnJa7VegnLX7lKW4azez4hhlPkyMNj6lu8"

echo  "find Archives Distribution  ${PRODUCT_NAME}.app file ...1 " >> $LOG
DATE=$( /bin/date +"%Y-%m-%d" )
ARCHIVE=$( /bin/ls -t "${HOME}/Library/Developer/Xcode/Archives/${DATE}" | /usr/bin/grep xcarchive | /usr/bin/sed -n 1p )
APP="${HOME}/Library/Developer/Xcode/Archives/${DATE}/${ARCHIVE}/Products/Applications/${PRODUCT_NAME}.app"
echo  "Step Done ----------1" >> $LOG

echo  "Gets the configuration of ${TARGET_NAME} from Info.plist ...2 " >> $LOG
#SIGNING_IDENTITY="iPhone Distribution: <Your Name>>"
#PROVISIONING_PROFILE="${HOME}/Library/MobileDevice/Provisioning Profiles/<filename>>.mobileprovision"
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#==========Get iCon=====================================================================================================================

cd "${APP}"
PATH_TO_ARTWORK=`find . -name ${ICON_NAME}`
/bin/cp ${PATH_TO_ARTWORK} /tmp/iTunesArtwork

#==========Get App Info=========================================================================================================================

#Get Version
cd "${SRCROOT}"
VERSION_SHORT=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${APP}/Info.plist")
VERSION_BUILD=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${APP}/Info.plist")
VERSION=`echo ${VERSION_SHORT}Build${VERSION_BUILD}`
#appId
APPID=$(/usr/libexec/PlistBuddy -c "Print CFBundleIdentifier" "${APP}/Info.plist")
echo  "Step Done ----------2" >> $LOG

#Package ipa file
echo  "Package .ipa for ${PRODUCT_NAME}...3 " >> $LOG
#if need set sign, add (--sign "${SIGNING_IDENTITY}" --embed "${PROVISIONING_PROFILE}")
xcrun -sdk iphoneos PackageApplication -v "${APP}" -o "/tmp/${PRODUCT_NAME}.ipa"
echo  "Step Done ----------3" >> $LOG

#get last commit if have
gitcommit=`git --git-dir="${SRCDIR}/.git" log -1 --oneline --pretty=format:'%s'`

echo  "Uploading to Fir.im  ....4 " >> $LOG

#==========Upload App========================================================================================================================

#Get App Info
Respones=`curl "http://fir.im/api/v2/app/info/"${APPID}"?token="${token}`
pkgkey=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bundle']['pkg']['key'];"`
pkgurl=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bundle']['pkg']['url'];"`
pkgtoken=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bundle']['pkg']['token'];"`
iconkey=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bundle']['icon']['key'];"`
iconurl=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bundle']['icon']['url'];"`
icontoken=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['bundle']['icon']['token'];"`
pkgid=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['id'];"`

#POST App To Fir.im
upicon=`curl -F "key="${iconkey} -F "token="${icontoken} -F "file=@/tmp/iTunesArtwork" ${iconurl}`

upipa=`curl -F "key="${pkgkey} -F "token="${pkgtoken} -F "file=@/tmp/${PRODUCT_NAME}.ipa" ${pkgurl}`

editinfo=`curl -d "changelog="${gitcommit}"&version="${VERSION} -X PUT "http://fir.im/api/v2/app/"${pkgid}"?token="${token}`

short=`echo ${Respones}| ruby -e "require 'rubygems'; require 'json'; puts JSON[STDIN.read]['short'];"`

echo "${Respones} || ${short} || ${pkgkey} || ${editinfo}" >> $LOG
#Open Download Url
open "http://fir.im/${short}"

echo  "finish load ----------OK" >> $LOG
echo  "To visit http://fir.im/${short} download!" >> $LOG

fi
exit 0
