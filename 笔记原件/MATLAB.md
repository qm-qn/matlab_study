#### 通用命令

| 指令   | 含义                     |
| ------ | ------------------------ |
| clf    | 清除图形窗               |
| clc    | 清除指令窗口显示内容     |
| clear  | 清除工作空间中保存的变量 |
| length | 求变量长度               |
| size   | 求变量长宽               |



#### 函数大全

##### fopen&fclose 文件开关

```
fid = fopen(文件地址, 打开方式);
status = fclose(fid); %关闭成功返回0，否则返回1
```

| 打开方式 | 代码       |
| -------- | ---------- |
| 'r'      | 只读       |
| 'w'      | 只写       |
| 'a'      | 在末尾添加 |
| 'r+'     | 可读可写   |



##### syms 定义符号变量

1、定义

```
syms x y
assume(x>0)
```



2、四则运算

```
syms x;
f=2*x^2+3*x-5;
g=f+x;
```



3、关系运算

| 运算符 | 函数 |
| ------ | ---- |
| <      | lt() |
| <=     | le() |
| >      | gt() |
| >=     | ge() |
| ==     | eq() |
| ~=     | ne() |



4、微积分函数

| 作用 | 函数                           |
| ---- | ------------------------------ |
| 极限 | limit(f, x, a, 'right'/'left') |
| 积分 | int(f, x)                      |
| 导数 | diff(f, x, n)                  |



5、因式函数

| 作用            | 函数         |
| --------------- | ------------ |
| 因式分解        | factor(f)    |
| 展开            | expand(f)    |
| 合并同类项      | collect(f)   |
| 按照v合并同类项 | collect(s,v) |
| 化简            | simplify(f)  |



6、精度设置

| 作用                       | 函数      |
| -------------------------- | --------- |
| 设置默认有效位数           | digits(n) |
| 求值F的n为有效位数的近似解 | vpa(F, n) |



7、其它函数

| 作用     | 函数            |
| -------- | --------------- |
| 用y替换x | subs(f, x, y)   |
| 重新计算 | eval(f)         |
| 绘图     | fplot(f, [a,b]) |



##### solve 解方程

1、单变量方程

```
syms x
answ = solve(sin(x) == 1, x)
或
syms x
eqn = sin(x) == 1;
answ = solve(eqn, x)
```

对于周期函数，若想得到全部解，需要设置第3，4个参数为'ReturnConditions', true



2、多变量方程组

```
syms u v a
eqn = [2*u + v == a, u - v == 1];
answ = solve(eqn, [u, v])
answ.u
answ.v
```



##### input 输入函数

1、输入的识别为数值

```
a = 10, b = 15;
c = input('the sum of a and b:')
the sum of a and b:a+b
c =
25
```



2、输入的识别为字符串

```
a = 10, b = 15;
c = input('the sum of a and b:', 's')
the sum of a and b:a+b
c =
a+b
```



##### roots 一元二次方程 

```matlab
>>p=[1,2,1]
>>r=roots(p)
```

```matlab
>>r=roots([1,2,1])
```



##### magic 魔方矩阵

```
A=magic(3)
```



##### linspace 步长

```
>>A=linspace(x1,x2,n)
```

从x1到x2共n个等距的数



##### xlsread 读取Excel

```
>>sw=xlsread(路径);
```



#### 基本知识

##### 冒号

```
>>a=[1,2,3; 4,5,6]
>>b=a(1:2, 2:3)
b=
	2 3
	5 6
//a的1-2行，2-3列
```



##### 数组某个数

```
>>a(2,3)
//a第二行第三列的数
>>a(n)
//a第n个数
```



##### 矩阵运算

###### inv 矩阵求逆

```
>>a=[1,2,3; 4,5,6; 7,8,9];
inv(a);
```



###### det 行列式的值

```
>>det(a);
```



###### eig 矩阵的特征值

```
<<eig(a);
```



###### diag 去除非对角元素

```
<<diag(a);
```



###### sqrt 矩阵开方

```
<<sqrt(a);
```



##### 数组运算

各位置独立运算

.*     ./     .\     .^

eg: 数组可作幂



##### 字符串运算

| 函数                          | 作用                                                   |
| ----------------------------- | ------------------------------------------------------ |
| strcat                        | 各部分横向拼接                                         |
| strvcat                       | 各部分纵向排布                                         |
| strrep(str1, str2, str3)      | 将str1中所有str2用str3替换                             |
| strfind(str, patten)          | 查找str中是否有patten，若有返回位置，若无返回空数组    |
| findstr(str1, str2)           | 查找str1, str2中较短者在较长者中的位置，同上           |
| strmatch(patten, str)         | 检测patten是否和str最左侧部分一致                      |
| token = strtok(str, patten)   | 取str中patten前的部分                                  |
| [token, remain] = strtok(str) | token取str中第一个空白符前的部分，remain保留剩下的部分 |
| strcmp(str1, str2)            | 比较两字符串是否相等                                   |
| strncmp(str1, str2, n)        | 比较两字符串前n个字符是否相等                          |
| strcmpi(str1, str2)           | 不区分大小写比较                                       |
| strcmpi(str1, str2, n)        | 不区分大小写比较                                       |
| isletter(str)                 | 检测是否都是字母                                       |
| isspace(str)                  | 检测是否都是格式字符                                   |
| isstrprop                     | 检测字符串每个字符是否属于制定的范围                   |
| blanks(n)                     | 创建由n个空格组成的字符串                              |
| deblank(str)                  | 裁剪尾部空格                                           |
| strtrim(str)                  | 裁剪头尾的空格、制表、回车                             |
| lower(str)                    | 变小写                                                 |
| upper(str)                    | 变大写                                                 |
| sort(str)                     | 按照ASCII值对字符重新排列                              |
| int2str(n)                    | 将整数转变成串                                         |
| num2str(n)                    | 将数值转变成串                                         |
| setstr(n)                     | 将ASCLL码转数值                                        |
| str2num(str)                  | 将串转变数值                                           |



##### 求余

| 函数     | 作用            |
| -------- | --------------- |
| rem(a,b) | 返回b/a后的余数 |
|          |                 |
|          |                 |



##### 取整函数

| 函数  | 作用     |
| ----- | -------- |
| fix   | 向0取整  |
| floor | 向下取整 |
| ceil  | 向上取整 |
| round | 四舍五入 |



##### 日期函数

| 函数            | 作用             |
| --------------- | ---------------- |
| datestr(now, n) | 获取当前时间     |
| clock           | （年月日时分秒） |
