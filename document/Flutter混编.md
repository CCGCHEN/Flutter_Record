# 背景
有时候一次性使用Flutter重写整个应用明显是不现实的，一般都是在应用中逐渐使用某些业务来使用Flutter来开发，在这种情况下，flutter可以作为一个library或者module的形式集成到你的APP中，作为UI展示的一部分或者是仅仅是运行一些dart的逻辑。那应该怎样进行集成呢？

## 源码集成方式
Flutter支持源码集成和aar集成的方式，源码集成的方式，Google天生支持，并且在开发的过程比较方便，但是也会有一定的缺陷：
- 需要团队所有的成员都安装有Flutter的开发环境，对于一些没有Flutter开发需求的同学其实不是那么友好；
- 编译速度会比较慢
- 需要对原有的编译体系进行修改，入侵性比较强；

这里先介绍一下源码集成的方式，按照下面的流程即可：
### 创建FlutterModule
有使用AS进行创建或者是命令行创建两种步骤，基本上没有差异，只不过编辑器创建的方式，会帮我们将所有的依赖都配置好了，不用我们再手动去配置。我们这里以AS创建的方式来介绍整个流程。

#### 新建Module
 > File-->New Module，选择FlutterModule，Module的存放位置可以根据你自己的需求进行存放。这里在app 同一层级，创建了一个叫android_module的来存放。
 > ![在这里插入图片描述](https://img-blog.csdnimg.cn/202003281144318.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2NoZW5jYW5ndWk=,size_16,color_FFFFFF,t_70)

#### 依赖引入
 
 1. **修改setting.gradle 文件，进行依赖引入** 
 
 ```
setBinding(new Binding([gradle: this]))
evaluate(new File(
        settingsDir,
        '/android_module/flutter_module/.android/include_flutter.groovy'
))
rootProject.name='FlutterMix'
include ':flutter_module'
project(':flutter_module').projectDir = new File('/android_module/flutter_module') 
 ```
 > 其中，setBinding与evaluate表示允许Flutter模块包括它自己在内的任何Flutter插件，在settings.gradle中以类似 :flutter、package_info的方式存在。sync 之后，会在如下路径，会有一个Flutter 文件夹生成。
 > ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328144146830.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2NoZW5jYW5ndWk=,size_16,color_FFFFFF,t_70)
 
2. **修改build.gradle进行依赖**
 > 在dependencies下面增加如下配置：` implementation project(path: ':flutter')`这里介绍一下，之所以要叫flutter，是因为跟上面第二步生成的Flutter 文件夹保持一致。另外，在android 标签增加使用java8来进行编译`compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
}`
 
#### 进行flutter 调用

```
public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FlutterView flutterView = Flutter.createView(this, getLifecycle(), "initialRoute");
        setContentView(flutterView);
    }
}
```
> ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328144937280.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2NoZW5jYW5ndWk=,size_16,color_FFFFFF,t_70)

#### 进行Flutter 代码开发调试
 > 使用AS打开module 工程。退出引用程序，然后点击Flutter attach，打开你的应用程序，等待连接上即可。就能够像正常开发一样调试flutter代码了。![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328151518245.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2NoZW5jYW5ndWk=,size_16,color_FFFFFF,t_70)

#### 遇到的问题
 如果你也是通过AS新创建的Demo工作来实践，可以会遇到相关依赖包找不到的问题，这个是因为你之前已经选择过工程支持androidx，新创建的默认都使用androidx的方式来进行相关的support支持。但是创建的Flutter 工程，还是使用的是普通的导入，删除其相关的导入，换成androidx的即可。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200328153351968.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2NoZW5jYW5ndWk=,size_16,color_FFFFFF,t_70)

## AAR产物集成的方式
上面提到，源码集成的方式，在我们日常的开发中，还是不太友好，所以这里继续介绍另外一种集成方式：产物aar集成。相关步骤如下：

1、cd 到对应的Flutter Module工程目录，执行`flutter build aar`

2、当你使用命令行打包时，打包完成后控制台会提示你如何使用aar
![](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200517225039.png)

3、在你需要引入的Android 工程上，添加上面的依赖即可。

4、使用Flutter相关界面

```
FlutterView flutterView = Flutter.createView(this, getLifecycle(), "initialRoute");
```
你的Android工程，并没有`FlutterFragment`、`Flutter`,这个从我们的flutter 模块拷贝过来即可。

![](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200517231612.png)

界面如下：

![](https://raw.githubusercontent.com/CCGCHEN/Image/master/20200517232010.png)

# 参考文章：

[官方文档](https://flutter.dev/docs/development/add-to-app/)

[AndroidX](https://developer.android.com/jetpack/androidx/releases/lifecycle)
