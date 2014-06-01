# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-random

CONFIG += sailfishapp

SOURCES += src/harbour-random.cpp

OTHER_FILES += qml/harbour-random.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-random.changes.in \
    rpm/harbour-random.spec \
    rpm/harbour-random.yaml \
    translations/*.ts \
    harbour-random.desktop \
    qml/JS/preferences.js \
    qml/pages/SettingsPage.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-random-de.ts

