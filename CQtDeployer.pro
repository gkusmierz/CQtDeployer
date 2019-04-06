#
# Copyright (C) 2018-2019 QuasarApp.
# Distributed under the lgplv3 software license, see the accompanying
# Everyone is permitted to copy and distribute verbatim copies
# of this license document, but changing it is not allowed.
#

TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS += QuasarAppLib \
           Pe \
           Deploy \
           CQtDeployer \
           UnitTests

contains(DEFINES, WITHOUT_BASE_TESTS) {
    SUBDIRS -= UnitTests
}

contains(DEFINES, WITH_ALL_TESTS) {
    SUBDIRS += \
    tests/TestOnlyC \
    tests/TestQtWidgets \
    tests/TestQMLWidgets
}

CQtDeployer.depends=QuasarAppLib
CQtDeployer.depends=Deploy

QuasarAppLib.file = $$PWD/QuasarAppLib/QuasarApp.pro
Pe.file = $$PWD/pe/pe-parser-library/pe-parser-library.pro

win32:include('$$PWD/CQtDeployerWinBuild.pri')

DISTFILES += \
    snapBuild.sh \
    staticBuild.sh \
    snap/snapcraft.yaml \
    README.md \
    sharedBuild.sh \
    README.md \
    staticBuildCrossWin32.sh \
    staticBuildCrossWin64.sh \
    sharedBuild.bat \
    sharedBuildCrossWin32.sh \
    sharedBuildCrossWin64.sh

