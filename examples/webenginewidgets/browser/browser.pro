TEMPLATE = app
TARGET = browser
QT += webenginewidgets network widgets printsupport
CONFIG += c++11

qtHaveModule(uitools):!embedded: QT += uitools
else: DEFINES += QT_NO_UITOOLS

FORMS += \
    addbookmarkdialog.ui \
    bookmarks.ui \
    cookies.ui \
    cookiesexceptions.ui \
    downloaditem.ui \
    downloads.ui \
    history.ui \
    passworddialog.ui \
    proxy.ui \
    settings.ui

HEADERS += \
    autosaver.h \
    bookmarks.h \
    browserapplication.h \
    browsermainwindow.h \
    chasewidget.h \
    downloadmanager.h \
    edittableview.h \
    edittreeview.h \
    featurepermissionbar.h\
    history.h \
    modelmenu.h \
    searchlineedit.h \
    settings.h \
    squeezelabel.h \
    tabwidget.h \
    toolbarsearch.h \
    urllineedit.h \
    webview.h \
    xbel.h

SOURCES += \
    autosaver.cpp \
    bookmarks.cpp \
    browserapplication.cpp \
    browsermainwindow.cpp \
    chasewidget.cpp \
    downloadmanager.cpp \
    edittableview.cpp \
    edittreeview.cpp \
    featurepermissionbar.cpp\
    history.cpp \
    modelmenu.cpp \
    searchlineedit.cpp \
    settings.cpp \
    squeezelabel.cpp \
    tabwidget.cpp \
    toolbarsearch.cpp \
    urllineedit.cpp \
    webview.cpp \
    xbel.cpp \
    main.cpp

RESOURCES += data/data.qrc htmls/htmls.qrc

contains(DEFINES, QWEBENGINEPAGE_SETNETWORKACCESSMANAGER) {
    HEADERS += cookiejar.h networkaccessmanager.h
    SOURCES += cookiejar.cpp networkaccessmanager.cpp
}

build_all:!build_pass {
    CONFIG -= build_all
    CONFIG += release
}

win32 {
   RC_FILE = browser.rc
}

mac {
    ICON = browser.icns
    QMAKE_INFO_PLIST = Info_mac.plist
    TARGET = Browser
}

EXAMPLE_FILES = Info_mac.plist browser.icns browser.ico browser.rc

# install
target.path = $$[QT_INSTALL_EXAMPLES]/webenginewidgets/browser
INSTALLS += target
