#-------------------------------------------------
#
# Project created by QtCreator 2012-08-02T07:50:29
#
#-------------------------------------------------

QT       += core gui sql printsupport

#Added in anticipation of QT 5
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Phoebetria
TEMPLATE = app

TRANSLATIONS =  resources/language/phoebetria_de.ts \
                resources/language/phoebetria_en.ts

PREFIX = /usr
BINDIR = $$PREFIX/bin
DATADIR = $$PREFIX/share
ICONDIR = $$DATADIR/icons/hicolor

INSTALLS += target desktop udev icon16 icon22 icon32 icon48 icon64 icon128 icon256 pixmap

target.path = $${BINDIR}

desktop.path = $${DATADIR}/applications
desktop.files += $${TARGET}.desktop

udev.path = /etc/udev/rules.d
udev.files += 99-fancontroller.rules

icon16.path = $${ICONDIR}/16x16/apps
icon16.files += resources/images/icons/16x16/phoebetria.png

icon22.path = $${ICONDIR}/22x22/apps
icon22.files += resources/images/icons/22x22/phoebetria.png

icon32.path = $${ICONDIR}/32x32/apps
icon32.files += resources/images/icons/32x32/phoebetria.png

icon48.path = $${ICONDIR}/48x48/apps
icon48.files += resources/images/icons/48x48/phoebetria.png

icon64.path = $${ICONDIR}/64x64/apps
icon64.files += resources/images/icons/64x64/phoebetria.png

icon128.path = $${ICONDIR}/128x128/apps
icon128.files += resources/images/icons/128x128/phoebetria.png

icon256.path = $${ICONDIR}/256x256/apps
icon256.files += resources/images/icons/256x256/phoebetria.png

icon512.path = $${ICONDIR}/512x512/apps
icon512.files += resources/images/icons/512x512/phoebetria.png

pixmap.path = $${DATADIR}/pixmaps
pixmap.files += resources/images/icons/48x48/phoebetria.png

SOURCES += src/bfx-recon/fancontrollerio.cpp \
    src/database/dbmanager.cpp \
    src/database/maindb.cpp \
    src/database/maindb_schema.cpp \
    src/fan/fanchanneldata.cpp \
    src/fan/fancontrollerdata.cpp \
    src/fan/fanprofiles.cpp \
    src/gui/gui_about.cpp \
    src/gui/gui_diagnostic.cpp \
    src/gui/gui_help.cpp \
    src/gui/gui_mainwindow.cpp \
    src/gui/gui_preferences.cpp \
    src/gui/gui_profiles.cpp \
    src/gui/gui_setmanualrpm.cpp \
    src/gui/gui_softwareautosetup.cpp \
    src/gui/themes.cpp \    
    src/preferences/preferences.cpp \
    src/qcustomplot/qcustomplot.cpp \
    src/softwareauto/fanramp.cpp \
    src/utils/timestampedtemperature.cpp \
    src/utils/utils.cpp \
    src/appinfo.cpp \
    src/averager.cpp \
    src/builddetails.cpp \
    src/device-io.cpp \
    src/dispatcher.cpp \
    src/main.cpp \
    src/phoebetriaapp.cpp \    
    src/languages/languages.cpp

HEADERS  += src/bfx-recon/bfxrecon.h \
    src/bfx-recon/fancontrollerio.h \
    src/database/dbmanager.h \
    src/database/maindb.h \
    src/database/maindb_schema.h \
    src/fan/fanchanneldata.h \
    src/fan/fancontrollerdata.h \
    src/fan/fanprofiles.h \
    src/gui/gui_about.h \
    src/gui/gui_diagnostic.h \
    src/gui/gui_help.h \
    src/gui/gui_mainwindow.h \
    src/gui/gui_preferences.h \
    src/gui/gui_profiles.h \
    src/gui/gui_setmanualrpm.h \
    src/gui/gui_softwareautosetup.h \
    src/gui/themes.h \    
    src/preferences/preferences.h \
    src/qcustomplot/qcustomplot.h \
    src/softwareauto/fanramp.h \
    src/utils/timestampedtemperature.h \
    src/utils/utils.h \
    src/appinfo.h \
    src/averager.h \
    src/builddetails.h \
    src/device-io.h \
    src/dispatcher.h \
    src/main.h \
    src/phoebetriaapp.h \
    src/languages/languages.h

FORMS    += ui/gui_about.ui \
    ui/gui_diagnostic.ui \
    ui/gui_help.ui \
    ui/gui_mainwindow.ui \
    ui/gui_preferences.ui \
    ui/gui_profiles.ui \
    ui/gui_setmanualrpm.ui \
    ui/gui_softwareautosetup.ui

RESOURCES += resources/gui_help.qrc \
    resources/gui_languages.qrc \
    resources/gui_resources.qrc

#-------------------------------------------------
# Config for the HID API library
#-------------------------------------------------

INCLUDEPATH += src/hidapi/hidapi/ \
               src/database/ \
               src/softwareauto/ \
               src/qcstomplot/
               
HEADERS += src/hidapi/hidapi/hidapi.h

#-------------------------------------------------
# Platform specific
#-------------------------------------------------

win32 {
    SOURCES += src/hidapi/windows/hid.c
    LIBS += -lsetupapi
    RC_FILE = windows/Phoebetria.rc
    CONFIG += exceptions rtti
}

unix:!macx {
    CONFIG += link_pkgconfig
    PKGCONFIG += libusb-1.0
    SOURCES += src/hidapi/libusb/hid.c
    LIBS += -lusb-1.0 -ludev -lrt
}

macx {
    QMAKE_INFO_PLIST = mac/Info.plist
    #QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.7
    #QMAKE_MAC_SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk
    LIBS += -framework CoreFoundation -framework IOKit
    SOURCES += src/hidapi/mac/hid.c
    ICON = mac/Phoebetria.icns
    APP_QML_FILES.files = mac/qt_menu.nib
    APP_QML_FILES.path = Contents/Resources
    QMAKE_BUNDLE_DATA += APP_QML_FILES
}

OTHER_FILES +=

