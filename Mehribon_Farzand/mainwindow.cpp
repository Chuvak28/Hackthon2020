#include "mainwindow.h"
#include "ui_mainwindow.h"
MainWindow::~MainWindow(){delete ui;}

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    createDockWindows();

//    toolBar = addToolBar(tr("Test"));
//    toolBar->setOrientation(Qt::Vertical);
//    map = new QAction("MAP");
//    toolBar->addAction(map);
//    graph = new QAction("GRAPH");
//    toolBar->addAction(graph);

//    QLabel *spacing = new QLabel;

//    toolBar->addWidget(spacing);

//    group = new QActionGroup(this);
//    group->addAction(map);
//    group->addAction(graph);

}

void MainWindow::createDockWindows()
{
    QDockWidget *dock = new QDockWidget(tr("Customers"), this);
    QWidget *wgt = new QWidget;
    dock->setAllowedAreas(Qt::LeftDockWidgetArea);
    btnMap = new QPushButton("MAP",wgt);
    btnAdd = new QPushButton("Add",wgt);
    btnGraph = new QPushButton("Graph",wgt);
    QVBoxLayout * layout = new QVBoxLayout;
    layout->addWidget(btnMap);
    layout->addWidget(btnAdd);
    layout->addWidget(btnGraph);
    wgt->setLayout(layout);
    dock->setWidget(wgt);

}



