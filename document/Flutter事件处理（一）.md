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
`Container`的使用的场景比较广泛，其他的控件都可以加多一层进行包装，以此来实现`margin、pading`等相关功能。
看到其构造函数，有一点可能比较疑惑的，不是有宽高了吗？为啥还有个constraints？其实这两个都是指定容器大小，
但如果同时存在，会以`constraints` 为准，其实width、height的最后实现，也是通过`constraints`来做的。

#### 2、继承关系
```dart

Object (dart.core)
  Diagnosticable (diagnostics.dart)
    DiagnosticableTree (diagnostics.dart)
      Widget (framework.dart)
        StatelessWidget (framework.dart)
          Container (container.dart)
```

#### 3、绘制过程
- 最里层是child
- child外层由Padding包着
- 然后添加额外的constraints限制
- 最后添加margin

![组成结构](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200426185040.png)
绘制的时候，首先绘制给定的变换(transform)，然后绘制装饰填充物，接着绘制child，最后将前景装饰绘制出来。

Container Widget 在没有子child的情况下，会尽可能地变大，除非传入的constraints是无边界的，在这种情况下，container会尽可能地小。
在有child的情况下，会根据child的参数来决定，但如果container 设置了width 、height或者constraints，则会根据这些参数来绘制。
#### 4、布局实现
因为Container融合了其他的一些widget，并且这些widget都有各自的布局行为，所以Container的布局方式有一些复杂。
总的来说：容器会尝试以下操作：
- 遵守对齐方式，根据子项调整大小，
- 遵守宽度，高度和约束，
- 扩展以适配父亲，以使其尽可能小

具体来讲就是：

如果`container`没有孩子，没有设置宽高，没有设置`constraints`，并且父容器设置了`constraints` 为 `unbounded`，那么`container`会让自己尽可能的小；

如果`container`没有孩子并且没有设置对齐方式，但是设置了宽高或者`constraints`(宽度最后其实都会转换成`constraints`去布局)，他会根据自己的`constraints`和父节点的`constraints`，尽可能地小；

如果`container`没有孩子，没有宽高没有`constraints`和`alignment`，但是父节点设置了有界的约束，那么`container`会尽可能根据父节点的有界约束尽可能地撑大自己；

如果`container`设置了对齐方式，并且父节点设置了无边界的约束，那么`container`会调节自身尺寸来包住子`child`;

如果`container`设置了对齐方式，并且父节点设置了有边界的约束，那么`container`会尽可能地撑大自己(根据父节点的大小)，然后将其子child按照设置的`alignment`进行调整；

如果`container`只有子`child`，没有设置宽高，没有设置`constraints`，没有设置alignment，那么`container`就会将父节点的`constraints`传递给孩子，并根据child进行调整；
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

![效果图-w200](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200426164410.png?token=ACWTSA2FZ6D6EXBP7VKLAH26UVFBU)

这里面的padding 和maring，如果你做过安卓或者iOS的开发，应该比较容易理解，其实就是一个是内部的空白，一个是外部的空白。

#### 3、适用场景
- 需要设置背景色；
- 需要设置圆角；
- 需要设置背景图片；
- 需要设置间距；

## 三、源码解析
```
  @override
  Widget build(BuildContext context) {
    Widget current = child;
    //如果没有child，并且没有设置constraints，那么就创建一个LimitedBox，
    if (child == null && (constraints == null || !constraints.isTight)) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }
    //设置对齐方式
    if (alignment != null)
      current = Align(alignment: alignment, child: current);

    final EdgeInsetsGeometry effectivePadding = _paddingIncludingDecoration;
    //设置间距
    if (effectivePadding != null)
      current = Padding(padding: effectivePadding, child: current);
      //设置背景色
    if (decoration != null)
      current = DecoratedBox(decoration: decoration, child: current);
      //设置前景色
    if (foregroundDecoration != null) {
      current = DecoratedBox(
        decoration: foregroundDecoration,
        position: DecorationPosition.foreground,
        child: current,
      );
    }
    //设置约束
    if (constraints != null)
      current = ConstrainedBox(constraints: constraints, child: current);
      //设置margin，其实最终也是包了一层padding来实现；
    if (margin != null)
      current = Padding(padding: margin, child: current);
      //最后，设置变换Transform
    if (transform != null)
      current = Transform(transform: transform, child: current);
    return current;
  }
```
`build`方法其实并不复杂，每行做的事情，已经注释，总的来讲，就是不设置约束情况，按照父节点尽可能大，如果有约束，则按照内部的来。

## 四、参考
https://api.flutter.dev/flutter/widgets/Container-class.html
