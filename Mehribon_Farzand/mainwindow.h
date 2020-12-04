#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QToolBar>
#include <QLabel>
#include <QDockWidget>
#include <QListWidget>
#include <QPushButton>
#include <QHBoxLayout>
#include <QVBoxLayout>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    QToolBar *toolBar;
    QAction *map;
    QAction *graph;
    QActionGroup *group;
    void createDockWindows();
    QListWidget *customerList;
    QListWidget *paragraphsList;
    QPushButton *btnMap;
    QPushButton *btnAdd;
    QPushButton *btnGraph;
    QMenu *viewMenu;

};
#endif // MAINWINDOW_H
