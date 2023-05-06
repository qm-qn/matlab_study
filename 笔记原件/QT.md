#### QMainWindow

##### 1、菜单栏    最多一个

1.1 创建菜单栏

```
QMenuBar * bar = MenuBar(void);
```

1.2 设置到本页面中

```
setMenuBar(bar);
```

1.3 创建菜单

```
QMenu * fileMenu = bar -> addMenu("文件");
```

1.4 创建菜单项

```
QAction * newAction = fileMenu -> addAction("新建");
```

1.5 创建小菜单

```
QMenu *helloMenu = fileMenu->addMenu("你好");
```

1.6 添加分割线

```
fileMenu -> addSeparator();
```



##### 2、工具栏	可以有多个

2.1 创建工具栏

```
QToolBar * toolbar = new QToolBar(this);
```

2.2 设置到本页面中，设置初始位置

```
addToolBar( 默认停靠区域, toolbar);
```

| 默认停靠位置 |                       |
| ------------ | --------------------- |
| left         | Qt::LeftToolBarArea   |
| right        | Qt::RightToolBarArea  |
| top          | Qt::TopToolBarArea    |
| bottom       | Qt::BottomToolBarArea |

2.3 设置后期可停靠区域 & 浮动 & 移动

```
toolbar->setAllowedAreas(位置1 | 位置2)
toolbar->setMovable(bool);
toolbar->setFloatable(bool);
```

2.4 添加菜单项 & 添加小控件

```
toolbar->addAction(QAction);
toolbar->addWidget(QWidget);
```



##### 3、状态栏	最多一个

3.1 创建状态栏

```
QStatusBar *stbar = statusBar(void);
```

3.2 设置到本页面中

```
setStatusBar(stbar);
```

3.3 添加左右控件

```
//左侧标签
    QLabel *lbl1 = new QLabel(this);
    lbl1->setText("左侧标签");
    stbar->addWidget(lbl1);
//右侧按钮
    QPushButton *btn1 = new QPushButton(this);
    btn1->setText("关闭");
    stbar->addPermanentWidget(btn1);
```



##### 4、铆接部件（浮动窗口）	可以多个

4.1 创建铆接部件

```
QDockWidget *dck1 = new QDockWidget(title, parent);
```

4.2 设置到本页面中 & 设置出现位置

```
addDockWidget(Qt::RightDockWidgetArea, dck1);
```



##### 5、中心部件	最多一个

```
QTextEdit *edit= new QTextEdit(this);
setCentralWidget(edit);	//QWidget*类型
```



#### 对话框

##### 1、模态对话框（不可以对其他窗口进行操作）

```
QDialog	dlg1(this);
dlg1.exec();		//模态
```



##### 2、非模态对话框（可以对其它窗口进行操作）

```
QDialog *dlg2 = new dlg2(this);		//在栈中开辟内存，防止函数运行完毕后释放dlg2，窗口一闪而过
dlg2->setAttribute(Qt::WA_DeleteOnClose);	//关闭该窗口时释放内存，防止内存泄漏
dlg2.show();		//非模态
```



##### 3、消息对话框 （模态对话框）

参数1  父亲； 参数2  标题； 参数3  提示内容； 参数4  显示的按钮； 参数5  默认选择的按钮

类型：（1）critical  （2）question （3）information （4）warning

```
QMessageBox::类型(this, "标题", "提示内容", QMessageBox::Save|QMessageBox::Cancel, QMessageBox::cancel);
```

返回类型： 	StandButton类型



##### 4、颜色对话框

返回类型 QColor

```
QColor color = QColorDialog::getColor(QColor(255,0,0));
qDebug()<<"红色:"<<color.red()<<'\t'<<"绿色:"<<color.green()<<'\t'<<"蓝色:"<<color.blue();
```



##### 5、文件对话框

5.1 返回类型 QString

5.2  参数1  父亲； 参数2  标题； 参数3  默认打开的文件位置； 参数4  显示出的文件类型

```
QString str1 = QFileDialog::getOpenFileName(this, "打开文件", "E:\\QT", "(*.cpp)");
qDebug()<<str1;
```



##### 6、字体对话框

6.1 返回值QFont

```
bool bl;
QFont font = QFontDialog::getFont(&bl, QFont("华文彩云",36));
qDebug()<<"字体:"<<font.family()<<'\t'<<"字号:"<<font.pointSize()<<'\t';
qDebug()<<"是否加粗:"<<font.bold()<<'\t'<<"是否倾斜:"<<font.italic();
```



#### 按钮

##### 1、Radio Button

1.1 设置默认勾选项

```
ui->radioButton->setChecked(true);
```



​	

#### 树控件

##### 1、 设置水平头

```
ui->treeWidget->setHeaderLables(QStringList()<<"内容1"<<"内容2“);

QTreeWidgetItem * item1 = new QTreeWidgetItem(QStringList()<<“内容");
```

##### 2、 加载顶层的结点

```
ui->treeWidget->addTopLevelItem(item1);
```

##### 3、 追加子节点

```
QStringList vegetable;
vegetable << "apple"<< "主力蔬菜";
QTreeWidgetItem * l1 = new QTreeWidgetItem(vegetable);
item1->addChild(l1);
```



#### 栈容器

##### 1、添加按钮，点击后跳转页面

```
connect(ui->btn, &QPushButton::clicked, [=](){
	ui->stackedWidget->setCurrentIndex(1);
});
```



#### 鼠标事件器

##### 1、流程

创建新文件——> 写入代码——> 修改3处——> 提升为

##### 2、功能

2.1 鼠标进入

```
void enterEvent(QEvent * event);
```

2.2 鼠标离开

```
void leaveEvent(QEvent * event);
```

2.1 鼠标按下

```
void mousePressEvent(QMouseEvent * ev);
```

2.1 鼠标释放

```
void mouseReleaseEvent(QMouseEvent * ev);
```

2.1 鼠标移动

```
void mouseMoveEvent(QMouseEvent * event);
```

