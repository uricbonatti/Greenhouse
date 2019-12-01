#include <QGuiApplication>
#include <QApplication> //Anexo
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QIcon>
#include <QDebug>
/* Versão Original

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("GreenHouse");
    QGuiApplication::setOrganizationName("DinoDev");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QIcon::setThemeName("GreenHouse");
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    qDebug() << " Offline storage path : " << engine.offlineStoragePath() ;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
*/

int main(int argc, char *argv[])
{
    QApplication::setApplicationName("GreenHouse");
    QApplication::setOrganizationName("DinoDev");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QIcon::setThemeName("GreenHouse");
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    qDebug() << " Offline storage path : " << engine.offlineStoragePath() ;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
