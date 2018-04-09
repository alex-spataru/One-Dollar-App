/*
 *         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *                   Version 2, December 2004
 *
 * Copyright (C) 2018 Alex Spataru <https://github.com/alex-spataru>
 *
 * Everyone is permitted to copy and distribute verbatim or modified
 * copies of this license document, and changing it is allowed as long
 * as the name is changed.
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  0. You just DO WHAT THE FUCK YOU WANT TO.
 */

#include "version.h"

#include <QtQml>
#include <QScreen>
#include <QQuickStyle>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main (int argc, char **argv) {
    QGuiApplication::setApplicationName (APP_NAME);
    QGuiApplication::setOrganizationName (APP_COMP);
    QGuiApplication::setApplicationVersion (APP_VERS);
    QGuiApplication::setAttribute (Qt::AA_EnableHighDpiScaling);

    QGuiApplication app (argc, argv);

    QQmlApplicationEngine engine;
    QQuickStyle::setStyle ("Material");
    engine.rootContext()->setContextProperty ("AppName", APP_NAME);
    engine.rootContext()->setContextProperty ("AppCompany", APP_COMP);
    engine.rootContext()->setContextProperty ("AppVersion", APP_VERS);
    engine.load (QUrl (QStringLiteral ("qrc:/qml/main.qml")));

    if (engine.rootObjects().isEmpty())
        return EXIT_FAILURE;

    return app.exec();
}
