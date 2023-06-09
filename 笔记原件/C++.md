#### others

###### 浮点数输出最大位数

默认输出单、双浮点数的最大有效位数为6

```c++
int a = 1234567;
float b = 1234567;
double c = 1234567;
cout << "a=" << a << endl;
cout << "b=" << b << endl;
cout << "c=" << c << endl;
```



###### 修改精度

fixed修改小数位数

setprecision(n)设置位数

```
cout << fixed << setprecision(4);
```



###### 输出“\”的方法

```
"\\"
```



###### \t制表符

占8位，对\t前的数进行%8处理

1、若小于8，则用空格凑足8位

2、若恰好整除，则直接空8位

```c++
	cout << "123456\thello world" << endl;
	cout << "12345678\thello world" << endl;
	cout << "123456789\thello world" << endl;
```





###### 整数相除结果

去尾法（无论正负号，只取整数部分）





###### 取模（取余）运算

1、两个数都必须为整数

2、a%b中 b!=0

3、根据除法结果推出答案

结论：一正一负的取模运算，先按照全是正数计算出答案的绝对值，答案和被取模数同号



###### 三目运算符

三目运算符返回的是变量，可以继续赋值

```
int a = 10;
int b = 20;
(a > b ? a : b) = 100;
cout << "a=" << a << endl;
cout << "b=" << b << endl;
```



###### switch特点

1、只能判断整形、字符型、枚举型，不能判断浮点型，字符串型和区间；

2、每个 case 末尾要添加 break 结束循环，否则会执行后面所有语句；

3、任意两处开关值不可相同；



###### 随机数代码

```
//头文件
#include<ctime>

int main()
{
	int a = 0;
	srand((unsigned int)time(NULL));
	for (int i = 0; i < 100; i++)
	{
		a = rand() % 100;	//要在循环中不断重置随机数//范围为0~99
		cout << a << endl;
	}
	return 0;
}
```



###### 函数的分文件编写

1、创建后缀名为.h的头文件

2、创建后缀名为.cpp的源文件

​		该源文件中仍要包含include<iostream>和using namespace std;

3、补充该源文件的定义

4、使用时，在要使用的文件的头文件中加上一行         “文件名"



###### 内联函数

1、声明中无需（但可以）加inline，定义中必须加inline。

2、内联函数将在编译时自动展开，减少编译过程。

3、仅在代码行数<=10时使用内联函数，谨慎对待析构函数（有隐藏的代码），不要内联循环和switch。

4、声明和定义均在类内的成员函数默认为内联函数。

```
int max(int a, int b);
inline int  max(int a, int b)
{
	return  a > b ? a : b;
}
```



###### 引用作为返回值

当函数返回一个引用时，则返回一个指向返回值的隐式指针。这样，函数就可以放在赋值语句的左边。



###### 左右对齐

left 	 左对齐

right	右对齐(默认)

```
cout<<left;
```



###### 计算长度

sizeof & strlen

```
char a[10] = "hello";
int l1 = sizeof(a);				//10
int l2 = strlen(a);				//5

const char* b = "hello";
int l3 = sizeof(b);				//8（指针地址的长度）
int l4 = strlen(b);				//5

char* c = new char[10];
int l5 = sizeof(c);				//8
int l6 = strlen(c);				//未知
```



###### 整理代码格式

1、Ctrl+A选中你要整理的部分；

2、Ctrl+K+D格式化对齐全篇代码

Ctrl+K+F对齐[光标](https://so.csdn.net/so/search?q=光标&spm=1001.2101.3001.7020)所在行或对齐选中代码行



#### 类与对象

##### 基础知识

若未声明属性，则默认为private



###### 定义对象指针

定义对象指针的时候，并不调用构造函数。

```
circle *pc; 	//并不调用构造函数
```



###### 复制构造函数

复制构造函数的参数必须采用引用。

如果其参数是真实的对象而不是引用，则又会引入新的一轮调用复制构造函数的过程，出现了无穷递归。

```
circle c1,c4;
circle c2(c1); //显式调用复制构造函数；
circle c3 = c1; //也是调用复制构造函数；
c4 = c2; //调用的赋值运算符
```



###### 无名对象

以直接调用构造函数的形式出现，可参与赋值、初始化、传参和作为返回值。

无名对象在初始化、传参和作为返回值的时候，不调用复制构造函数。

```
circle c = circle(2); 
```

 原意：circle(2)的原意是以2为实参创建无名对象，并用该无名对象来复制构造c。

 实际：为了提高编译器效率，省略了无名对象的构造过程，直接用其实参2来构造了c。

 等价于

```
circle c(2);
```

在以下场合，无名对象会在完成运算后直接析构，

```
circle a; a = circle(2); //这里真正产生了无名对象，运算之后立刻析构；
```

在其它需要调用复制构造函数的场合，无名对象并不产生，而直接用其参数来构造相应的对象（如形参、临时对象等）。



###### 构造函数另一格式

对于不含对象成员的类对象的初始化，也可以套用以上的格式，把部分需要直接赋初值的变量初始化写在冒号的右边：

类名::构造函数名(参数表):变量1(初值1),……,变量n(初值n){……}

```
Class(string name, int age): m_name(name), m_age(age)   {			}
```

冒号以后部分实际是函数体的一部分，所以在构造函数的声明中，冒号及冒号以后部分必须略去。



###### 引用对象常量

使用引用可以省去复制构造函数的开销，提高程序效率；

使用引用使得实参有被更改的危险（如果不是有意的话），使用const保护之后则可以避免



###### 友元函数

在友元函数中，不能使用**this**指针。



###### 类中的静态成员

类内声明，类外定义

一、静态数据成员（数值）

```
static int count
```

1、在类外面进行唯一的一次初始化，此时计算机为静态数据成员分配空间。注意该语句必须放在任何函数执行之前。

2、静态数据是该类所有对象所共有的，可提供同一类的所有对象之间信息交换的捷径。

3、静态数据所占的空间由系统在编译时分配，而在定义对象时不再为静态成员分配空间。

4、静态数据成员属于整个类

5、需要在类外初始化

```
int Person::count
```

在类的成员函数等当中使用静态数据成员，如在构造函数中对count自增，在析构函数中对count自减。

这种方式可以得到该类对象的数量



二、静态函数成员

1、静态函数成员没有this指针，因此它不能访问类当中的非静态成员，一般只用来专门操作静态数据成员。

使用方式：

```
class Aaa
{
public:
	static func()
	{
		cout<<"func"<<endl;
	}
};

void test01()
{
	Aaa a1;
	Aaa::func();	//用法一
	a1.func();		//用法二
}
```



###### 用const保护类

一、常成员函数

在成员函数参数列表后加const

1、常成员函数中不能修改任何类当中的数据成员，否则编译错误。

```
void show() const
{
	//r=1;		//error,不可修改数据
	cout<<r<<endl;
}
```



二、常成员数据

1、常成员数据需要初始化，但不能在构造函数体当中赋值，只能通过构造函数初始化列表中进行，或者在类中声明的时候直接定义。

```
class Aaa
{
Public:
	const int a=1;
	Aaa(int b=0):a(b)
{
	//a=b;		//error
}
```



三、对象常量

```
const Aaa b(9);
```

1、该对象中的所有数据成员都将不能修改。

2、对象常量只能通过构造函数来进行数据的初始化。

<!--对象常量在调用类的成员函数时，只能调用常成员函数！-->



##### 继承与多态

###### 继承

| 类成员/继承方式 | 公有派生  | 保护派生  | 私有派生 |
| --------------- | --------- | --------- | -------- |
| public成员      | public    | protected | private  |
| protected成员   | protected | protected | private  |
| private成员     | 不可访问  | 不可访问  | 不可访问 |



###### 构造函数执行次序

1、调用基类构造函数，按它们在派生类定义的先后顺序，顺序调用。

2、调用成员对象的构造函数，按它们在类定义中声明的先后顺序，顺序调用。

3、派生类的构造函数体中的操作。



###### 构造函数定义

1、在构造函数的声明中，冒号及冒号以后部分必须略去。

2、如果基类没有定义构造函数，则派生类也可以不定义构造函数。

3、在派生类构造函数中，只要基类不是使用无参的默认构造函数都要显式给出基类名和参数表。

```
class Person
{
	string name;
	int age;
public:						//构造函数必须是公有类型，否则派生类无法调用
	Person(string _name, int _age)
	{
		name = _name;
		age = _age;
	}
};

class Student : public Person
{
	int price;
	Student(string _name, int _age, int _price);
};

Student::Student(string _name, int _age, int _price) :Person(_name, _age)//Person参数表为实参
{
	price = _price;
}
```



###### 同名隐藏

1、若采用直接覆盖的形式，那么即使将派生类对象的地址赋值给基类指针，用该指针调用函数时也只会调用基类函数。

```
void test01()
{
	B b;
	b.print();  //子类函数
	b.A::print(); //暴露父类的同名函数
}
```



###### 赋值兼容

1、可以将一个派生类的对象的地址赋给其基类的指针变量，但只能通过这个指针访问派生类中由基类继承来的成员，不能访问派生类中的新成员。

2、不能将基类的地址赋给派生类的指针。

总结：  只能多的（派生类）给少的（基类），但调用不了多出来的部分（同名新函数也算新成员）

```
int main()
{
	A a1;
	A* p = &a1;
	B b1;
	B* q = &b1;
	//q = p;		//不能访问派生类中的新成员
	p = q;
	p->_a = 0;
	//p->_b = 0;	//不能将基类的地址赋给派生类的指针
	return 0;
}
```



###### 虚函数

1、可以将派生类对象地址赋值给基类对象地址，调用该对象的虚函数时，会调用派生类中的虚函数。

2、静态成员和内联函数不能作为虚函数。



###### 纯虚函数

1、不定义函数实现部分，即使是{}也不可以。

2、可以继承。

3、派生类中必须有重新定义的函数体。

4、“=0”本质上是将指向函数体的指针定为NULL。

5、拥有纯虚函数的类成为抽象类，不可以定义对象。

```
virtual int seek(int a) = 0;
//virtual int seek(int a) {}= 0;	//error
```







#### 模板



###### 函数模板的重载

如果存在同名普通函数，则普通函数的重载优先级最高。



###### 自动类型推导

1、函数模板可以进行自动类型推导。

2、类模板不可进行自动类型推导，必须使用显示指定类型的方式。



#### 动态内存分配



###### 注意事项

1、申请内存之后，必须判断获得的指针是否有效。

```
if( p==NULL) {exit(-1);} 	//提前终止程序
```

2、用new申请获得的指针值，一般不宜改动。如必须改动，需要通过备份值来释放。

3、释放完指针值后，将其置为NULL是最佳方案。

```
delete p;
p=NULL;
```



###### 二维数组

```
double **date = new double *[n];
for(int i = 0; i<n; i++)
{
	date[i] = new double[m];
}
```



###### 生存期

和局部变量不同，动态分配变量的生存期并不受作用域的限制。



###### 深复制

如原先已分配，应删除旧空间



#### 线性表

##### 一、链表

1、生成链表：

```
template <typename T> class Node
{
	T info;				//数据域
	Node <T>* link;		//指针域
public:
	Node()
	{
		link = NULL;
	}
	Node(const T &data)
	{
		info = data;
		link = NULL;
	}
};
```



#### 流类库与输入输出



| 代码          | 功能                                                       |
| ------------- | ---------------------------------------------------------- |
| ios::in       | 为输入（读）打开文件                                       |
| ios::out      | 为输出（写）打开文件                                       |
| ios::ate      | 初始位置：文件尾                                           |
| ios::app      | 若文件不存在，则创建文件；若文件存在，则在文件末尾继续添加 |
| ios::trunc    | 若文件不存在，则创建文件；若文件存在，则删除原文件继续添加 |
| ios::binary   | 二进制方式                                                 |
| ios::nocreate | 不建立文件，文件不存在的时候打开失败                       |
| ios::replace  | 不替代文件，文件存在的时候打开失败                         |



###### cin.rdstate();

| 状态字   | 数值 | 意义                                  |
| -------- | ---- | ------------------------------------- |
| goodbit  | 0x00 | 无错误                                |
| eofbit   | 0x01 | 输入流结束或文件结束已无数据可取      |
| failbit  | 0x02 | 最近的I/O操作失败，流可恢复（溢出时） |
| badbit   | 0x04 | 最近的I/O操作非法，流可恢复           |
| hardfail | 0x08 | I/O出现致命错误，流不可恢复           |



###### cin.clear（）

清空上述错误状态



###### cin.sync（） 

清空缓冲区数据（老版本编译器适用，新版不起作用）

建议更换为

```
char a[10];

cin.getline(a,10)
```



###### cin.ignore(n,a) 

1、清空缓冲区n个字符或者清除到a这个字符就停止

2、默认参数为cin.ignore(1, EOF) 【EOF：End Of File，文件结束符】。此时会舍弃一个字符，若遇到文件结束符则退出。



###### gcount ()

gcount()被用于输入流，并返回上一次输入操作被读入的字符的数目。

| 字符     | 数目 |
| -------- | ---- |
| 数字     | 1    |
| 字母     | 1    |
| 汉字     | 3    |
| 英文字符 | 1    |
| 中文字符 | 3    |
| 空格     | 1    |
| 制表符   | 1    |
| 回车     | 2    |



###### cin.getline(a, n, '#')

1、若读取n个字符后未遇到'#'字符，则将n个字符全部存入字符数组a中。（记得重置流状态）

2、若遇到'#'字符，则提取出'#'字符，**舍弃**，将之前提取的字符存入字符数组a中

3、会清空数组a

4、'#' 默认为‘ \n'



###### cin.get(a, n, '#')

1、若读取n个字符后未遇到'#'字符，则将n个字符全部存入字符数组a中。（不必重置流状态）

2、若遇到'#'字符，则提取出'#'字符，**不舍弃**，将之前提取的字符存入字符数组a中

3、会清空数组a



###### ifile

可用来检测是否打开成功

```
ifstream ifile("1.txt");
if(ifile) 
{
	cout<<"打开"<<endl;
}
else
{
	cout<<"未打开"<<endl;
}
```



###### ifile.is_open()

如果成功打开文件，返回1，否则返回0。

```
ifile.is_open();
```



###### ifile.eof()

如果读取到文件结尾，返回1，否则返回0。



###### ifile.seekg(int, ios::_dir)

ofile.seekp(int, ios::_dir)

int表示距该位置的距离，可为负值。

| ios::_dir | 功能         |
| --------- | ------------ |
| ios::beg  | 移至文件头   |
| ios::cur  | 移至当前位置 |
| ios::end  | 移至文件尾   |



###### ifile.tellg()

ofile.tellp()

读出位移的偏移值

```
ifstream ifile;
ifile.open("E:\\C++\\2.txt");
ifile.seekg(0,ios::end);
cout << ifile.tellg() << endl;
```



###### ifile.setf（）

| 1              | 2                      |
| -------------- | ---------------------- |
| ifile.setf()   | 开启功能               |
| ifile.unsetf() | 关闭功能               |
| ios::skipws    | 跳过空白符（默认开启） |
| 空白符         | 空格，回车，制表       |



###### ifile.read (char *, int)

从二进制文件中读取n个字节，送入第一个参数指定的位置



###### ofile.write （char *, int)

从第一个参数指定的位置读取n个字节，写入指定的文件

