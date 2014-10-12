#/bin/sh
export PATH=/opt/local/bin/:/opt/local/sbin:$PATH:/usr/local/bin:

DATE=$( /bin/date +"%Y-%m-%d" )
ARCHIVE=$( /bin/ls -t "${HOME}/Library/Developer/Xcode/Archives/${DATE}" | /usr/bin/grep xcarchive | /usr/bin/sed -n 1p )
APP="${HOME}/Library/Developer/Xcode/Archives/${DATE}/${ARCHIVE}/Products/Applications/${PRODUCT_NAME}.app"
APPID=$(/usr/libexec/PlistBuddy -c "Print CFBundleIdentifier" "${APP}/Info.plist")
LOG="/tmp/archiveVersioning.log"
/bin/rm "/tmp/archiveVersioning.log"

FLAG="net."

if [[ "${APPID/$FLAG/}" == "$FLAG" ]]; then
echo "Isn't AppEnterpriseAppID!" >> $LOG
exit 0;
fi

convertPath=`which convert`
echo ${convertPath}
if [[ ! -f ${convertPath} || -z ${convertPath} ]]; then
    echo "WARNING: Skipping Icon versioning, you need to install ImageMagick and ghostscript (fonts) first, you can use brew to simplify process:
    brew install imagemagick
    brew install ghostscript" >> $LOG
    exit 0;
fi

cd "${SRCROOT}"
commit=`git rev-parse --short HEAD`
branch=`git rev-parse --abbrev-ref HEAD`
version=`/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${APP}/Info.plist"`
shortVersion=`/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${APP}/Info.plist"`
build_num=`git rev-list HEAD --count`

shopt -s extglob
build_num="${build_num##*( )}"
shopt -u extglob
caption="Version [${shortVersion}]\n${branch}\n${commit}"
echo $caption >> $LOG

function processIcon() {
    base_file=$1
    cd "${APP}"
    base_path=`find . -name ${base_file}`

    echo "Processing $base_path"

    if [[ ! -f ${base_path} || -z ${base_path} ]]; then
    return;
    fi

    target_file=$base_path
    target_path="${APP}/${target_file}"

    echo "Reverting optimized PNG to normal" >> $LOG
    # form a normalized png filename
    base_tmp_normalizedFileName="${base_file%.*}-normalized.${base_file##*.}"
    base_tmp_path=`dirname $base_path`
    base_tmp_normalizedFilePath="${base_tmp_path}/${base_tmp_normalizedFileName}"

    # Normalize
    echo "xcrun -sdk iphoneos pngcrush -revert-iphone-optimizations -q $base_path $base_tmp_normalizedFilePath" >> $LOG
    xcrun -sdk iphoneos pngcrush -revert-iphone-optimizations -q "$base_path" "$base_tmp_normalizedFilePath"

    # Remove pngcrush png
    echo "Removing pngcrushed png file at $base_path" >> $LOG
    rm "$base_path"

    # Rename normalized png's filename to original one
    echo "Moving normalized png file to original one" >> $LOG
    mv "$base_tmp_normalizedFilePath" "$base_path"

    width=`identify -format %w ${base_path}`
    height=`identify -format %h ${base_path}`
    band_height=$((($height * 47) / 100))
    band_position=$(($height - $band_height))
    text_position=$(($band_position - 3))
    point_size=$(((13 * $width) / 100))

    echo "Image dimensions ($width x $height) - band height $band_height @ $band_position - point size $point_size" >> $LOG

    #
    # blur band and text
    #
    convert $base_path -blur 10x8 /tmp/blurred.png
    convert /tmp/blurred.png -gamma 0 -fill white -draw "rectangle 0,$band_position,$width,$height" /tmp/mask.png
    convert -size ${width}x${band_height} xc:none -fill 'rgba(0,0,0,0.2)' -draw "rectangle 0,0,$width,$band_height" /tmp/labels-base.png
    convert -background none -size ${width}x${band_height} -pointsize $point_size -fill white -gravity center -gravity South caption:"$caption" /tmp/labels.png

    convert $base_path /tmp/blurred.png /tmp/mask.png -composite /tmp/temp.png

    rm /tmp/blurred.png
    rm /tmp/mask.png

    #
    # compose final image
    #
    filename=New$base_file
    convert /tmp/temp.png /tmp/labels-base.png -geometry +0+$band_position -composite /tmp/labels.png -geometry +0+$text_position -geometry +${w}-${h} -composite "$target_path"

    # clean up
    rm /tmp/temp.png
    rm /tmp/labels-base.png
    rm /tmp/labels.png

    echo "Overlayed ${target_path}" >> $LOG
}

icon_count=`/usr/libexec/PlistBuddy -c "Print CFBundleIcons:CFBundlePrimaryIcon:CFBundleIconFiles" "${APP}/Info.plist" | wc -l`
last_icon_index=$((${icon_count} - 2))
echo "${icon_count}" >> $LOG
i=0
while [  $i -lt $last_icon_index ]; do
    icon=`/usr/libexec/PlistBuddy -c "Print CFBundleIcons:CFBundlePrimaryIcon:CFBundleIconFiles:$i" "${APP}/Info.plist"`
echo "${icon}" >> $LOG
    if [[ $icon == *.png ]] || [[ $icon == *.PNG ]]
    then
	processIcon $icon
    else
	processIcon "${icon}.png"
	processIcon "${icon}@2x.png"
    fi
    let i=i+1
done
