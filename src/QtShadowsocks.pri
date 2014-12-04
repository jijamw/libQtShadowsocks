# This file is part of project libQtShadowsocks
# Copyright (C) 2014, Symeon Huang <hzwhuang@gmail.com>
# Licensed Under GPLv3

SOURCES  += \
    src/encryptor.cpp \
    src/connection.cpp \
    src/basecontroller.cpp \
    src/localcontroller.cpp \
    src/udprelay.cpp \
    src/common.cpp

HEADERS  += \
    src/profile.h \
    src/encryptor.h \
    src/connection.h \
    src/basecontroller.h \
    src/localcontroller.h \
    src/udprelay.h \
    src/common.h

unix: {
    target.path = /usr/lib
    INSTALLS   += target

    CONFIG     += link_pkgconfig
    PKGCONFIG  += qca2 botan-1.10

    VERSION     = 0.1
}

win32: {
    DEFINES    += "FD_SETSIZE=1024"#increase the maximum pending tcp sockets. this value is 64 on Windows by default
    win32-msvc2013: {
        DESTDIR = $$top_srcdir/lib/msvc2013
    }
    else: {
        error ("Only support MSVC2013 compiler on Windows platform.")
    }
}
