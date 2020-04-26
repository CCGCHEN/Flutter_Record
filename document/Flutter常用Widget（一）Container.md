# Flutter常用Widget（一）Container
> 详细介绍Container的相关使用。
## 一、简介
> A convenience widget that combines common painting, positioning, and sizing widgets.

一个使用方便的小部件，它融合了常见的绘画，定位和大小调整。

####  1、构造函数
```dart
  Container({
    Key key,    //
    this.alignment, //对齐方式，作用于child，譬如如果是center,表示child在container里面居中
    this.padding, //内部间距
    Color color,  //背景色，
    Decoration decoration,  //背景装饰，与color 不能共存，如需要设置背景，里面也设置背景的方式。
    this.foregroundDecoration,  //前景装饰
    double width, //宽度
    double height,  //高度
    BoxConstraints constraints, //容器大小的限制条件，跟宽高的区别是
    this.margin,  //间距，类似于layoutParams 的maring.
    this.transform, //变换，类似于安卓的矩阵变换.
    this.child,   //对应的控件
  });
```

Container的使用的场景比较广泛，其他的控件都可以加多一层进行包装，以此来实现margin、pading等相关功能。
看到其构造函数，有一点可能比较疑惑的，不是有宽高了吗？为啥还有个constraints？其实这两个都是指定容器大小，
但如果同时存在，会以constraints 为准，其实width、height的最后实现，也是通过constraints来做的。

#### 2、继承关系

#### 3、绘制过程

#### 4、布局实现


## 二、使用方式

#### 1、代码示例
```dart
class ContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 45, left: 120),
      padding: EdgeInsets.all(20),

//      color: Colors.yellow,

      decoration: BoxDecoration(  //背景装饰
          color: Colors.yellow,
          gradient: RadialGradient( //渐变
            colors: [Colors.red, Colors.orange],
            center: Alignment.center,
            radius: .98,
          ),

          boxShadow: [  //卡片阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )
          ]
      ),

      transform: Matrix4.rotationZ(0.2),

      child: Text("520", style: TextStyle(color: Colors.white, fontSize: 40.0), ),
    );
  }

}
```
#### 2、效果图

![效果图](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200426164410.png?token=ACWTSA2FZ6D6EXBP7VKLAH26UVFBU)

这里面的padding 和maring，如果你做过安卓或者iOS的开发，应该比较容易理解，其实就是一个是内部的空白，一个是外部的空白。

## 三、源码解析


## 四、参考
https://api.flutter.dev/flutter/widgets/Container-class.html