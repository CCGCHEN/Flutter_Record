# 背景
有时候一次性使用Flutter重写整个应用明显是不现实的，一般都是在应用中逐渐使用某些业务来使用Flutter来开发，在这种情况下，flutter可以作为一个library或者module的形式集成到你的APP中，作为UI展示的一部分或者是仅仅是运行一些dart的逻辑。那应该怎样进行集成呢？

## 源码集成方式
虽然说Flutter支持源码集成和aar集成的方式，但是官方只是介绍了源码集成的方式。所以aar集成的方式，下面再接续介绍。源码集成的方式，按照下面的流程即可：
#### 1、创建FlutterModule
有使用AS进行创建或者是命令行创建两种步骤，基本上没有差异，只不过编辑器创建的方式，会帮我们将所有的依赖都配置好了，不用我们再手动去配置。

**File-->New-->New Module选择FlutterModule**,注意，这里的FlutterModule的存放位置，可以是在你工程的某个文件夹内，或者是跟你的工程同级。这个看你自己的需求进行设置即可。
![相关步骤](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200514081159.png)



官方文档[https://flutter.dev/docs/development/add-to-app/](https://flutter.dev/docs/development/add-to-app/)



### Attach
- Android ：一般是先 Flutter Attach 之后再启动App
- iOS： 可以先运行app 然后直接 Flutter Attach；

为啥有这个差别呢？
