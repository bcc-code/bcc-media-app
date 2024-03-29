LOG_FILE=${PROJECT_DIR}/prebuild.log
ERROR_FILE=${PROJECT_DIR}/Runner/SchemePreActions.h

exec > $LOG_FILE 2>&1
echo "// auto-generated" > $ERROR_FILE

trap "echo '#error Pre-action script failed, this is here to prevent the build from succeeding. See $LOG_FILE.' >> $ERROR_FILE; exit 1" ERR

environment="default"

# Regex to extract the scheme name from the Build Configuration
# We have named our Build Configurations as Debug-dev, Debug-prod etc.
# Here, dev and prod are the scheme names. This kind of naming is required by Flutter for flavors to work.
# We are using the $CONFIGURATION variable available in the XCode build environment to extract
# the environment (or flavor)
# For eg.
# If CONFIGURATION="Debug-prod", then environment will get set to "prod".
if [[ $CONFIGURATION =~ -([^-]*)$ ]]; then
environment=${BASH_REMATCH[1]}
fi

echo $environment

# Name and path of the resource we're copying
FIREBASE_APP_ID_JSON=firebase_app_id_file.json
FIREBASE_APP_ID_FILE=${PROJECT_DIR}/../firebase/${environment}/${FIREBASE_APP_ID_JSON}

GOOGLESERVICE_INFO_PLIST=GoogleService-Info.plist
GOOGLESERVICE_INFO_FILE=${PROJECT_DIR}/../firebase/${environment}/${GOOGLESERVICE_INFO_PLIST}

# Make sure GoogleService-Info.plist exists
echo "Looking for ${GOOGLESERVICE_INFO_PLIST} in ${GOOGLESERVICE_INFO_FILE}"
if [ ! -f $GOOGLESERVICE_INFO_FILE ]
then
echo "No GoogleService-Info.plist found. Please ensure it's in the proper directory."
exit 1
fi

# Make sure firebase_app_id_file.json exists
echo "Looking for ${FIREBASE_APP_ID_JSON} in ${FIREBASE_APP_ID_FILE}"
if [ ! -f $FIREBASE_APP_ID_FILE ]
then
echo "No firebase_app_id_file.json found. Please ensure it's in the proper directory."
exit 1
fi


FIREBASE_PLIST_JSON_DESTINATION=${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app
FIREBASE_PLIST_JSON_DESTINATION="${PROJECT_DIR}/Runner/"
# Get a reference to the destination location for the GoogleService-Info.plist
# This is the default location where Firebase init code expects to find GoogleServices-Info.plist file
echo "Will copy ${GOOGLESERVICE_INFO_PLIST} to final destination: ${FIREBASE_PLIST_JSON_DESTINATION}"

# Get a reference to the destination location for the firebase_app_id_file.json
# This is the default location where Firebase init code expects to find firebase_app_id_file.json file
echo "Will copy ${FIREBASE_APP_ID_JSON} to final destination: ${FIREBASE_PLIST_JSON_DESTINATION}"

# Copy over the prod GoogleService-Info.plist for Release builds
cp "${GOOGLESERVICE_INFO_FILE}" "${FIREBASE_PLIST_JSON_DESTINATION}"

# Copy over the prod firebase_app_id_file.json for Release builds
cp "${FIREBASE_APP_ID_FILE}" "${FIREBASE_PLIST_JSON_DESTINATION}"
