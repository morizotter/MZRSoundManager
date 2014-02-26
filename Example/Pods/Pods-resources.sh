#!/bin/sh
set -e

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcassets)
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
install_resource "../../Resources/Octave-Sounds/beeps/beep-attention.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-bop.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-brightpop.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-glitchy.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-hightone.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-holdtone.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-horn.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-metallic.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-organ.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-piano.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-plucked.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-reedy.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-rejected.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-roadblock.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-scrapy.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-scratchy.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-sharpstring.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-shinymetal.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-tapped.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-timber.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-warmguitar.aif"
install_resource "../../Resources/Octave-Sounds/beeps/beep-xylo.aif"
install_resource "../../Resources/Octave-Sounds/slides/slide-magic.aif"
install_resource "../../Resources/Octave-Sounds/slides/slide-metal.aif"
install_resource "../../Resources/Octave-Sounds/slides/slide-network.aif"
install_resource "../../Resources/Octave-Sounds/slides/slide-paper.aif"
install_resource "../../Resources/Octave-Sounds/slides/slide-rock.aif"
install_resource "../../Resources/Octave-Sounds/slides/slide-scissors.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-crisp.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-double.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-fuzzy.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-hollow.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-kissy.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-mellow.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-metallic.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-muted.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-percussive.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-professional.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-resonant.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-scratchy.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-simple.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-sizzle.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-smallest.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-toothy.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-vocal.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-warm.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-wooden.aif"
install_resource "../../Resources/Octave-Sounds/taps/tap-zipper.aif"

rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ `xcrun --find actool` ] && [ `find . -name '*.xcassets' | wc -l` -ne 0 ]
then
  case "${TARGETED_DEVICE_FAMILY}" in 
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;  
  esac 
  find "${PWD}" -name "*.xcassets" -print0 | xargs -0 actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
