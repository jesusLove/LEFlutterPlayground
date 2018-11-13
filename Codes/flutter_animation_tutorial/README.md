# flutter_animation_tutorial


## 主要任务

> 如何使用动画库中的基础类，将动画添加到Widget中。
> 如何使用AnimatedWidget和AnimatedBuilder。

## 概念和类

* Animation对象是Flutter动画库中的一个核心类，它生成指导动画的值。
* Animation对象知道动画的当前状态（例如，它是开始、停止还是向前或向后移动），但它不知道屏幕上显示的内容。
* AnimationController管理Animation。
* CurvedAnimation 将过程抽象为一个非线性曲线.
* Tween在正在执行动画的对象所使用的数据范围之间生成值。例如，Tween可能会生成从红到蓝之间的色值，或者从0到255。
* 使用Listeners和StatusListeners监听动画状态改变。


### Animation<double>

`Animation`一个抽象类，拥有当前值和状态。在一段时间一次生成一个区间之间值，输出可以是线性，曲线，步进函数或者任何其他的映射。

### CurvedAnimation

定义一个非线性曲线。它是`Animation<double>`类型，CurvedAnimation包装它正在修改的对象 

### AnimationController 

一个特殊的`Animation`对象，屏幕的每一帧都会生成一个新的值。

同`CurvedAnimation`一样派生自`Animation<double>`。除了具有`Animation<double>`的功能外，还具有其他的控制动画的方法。

`.forward()`启动动画，数字的产生与屏幕刷新有关。

### Tween

定义从输入范围到输出范围的映射。`AnimationController`对象的范围是0.0到1.0，如果使用不同的范围，使用Tween来配置。


