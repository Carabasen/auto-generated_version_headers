#include "mainwindow.h"
#include <QApplication>
#include "uversion.h"

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
	MainWindow w;
	w.setWindowTitle(SOFTWARE_VERSION);
	w.show();
	return a.exec();
}
