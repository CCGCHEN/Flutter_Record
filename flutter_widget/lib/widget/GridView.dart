import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/bean/tiny_app_item.dart';

class GridViewImage extends StatefulWidget {

  GridViewImage();

  @override
  State<StatefulWidget> createState() {
    return _GridViewImageState();
  }
}

class _GridViewImageState extends State<GridViewImage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.0, right: 22.0),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 12),
              height: 48,
              alignment: Alignment.centerLeft,
              child: Text("常用APP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'PingFangSC-Semibold'),),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 12),
              child: _GridViewItemWidget(),
            ),
          ),
        ],
      ),
    );
  }

}

class _GridViewItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GridViewItemWidgetState();
}

class _GridViewItemWidgetState extends State<_GridViewItemWidget> {
  int selectIndex = 0;
  List<AppItem> dataBeans = List();
  double itemMargin;
  var hotChildAspectRatio;

  @override
  void initState() {
    super.initState();
  }

  double _getRadio() {
    return hotChildAspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    List<AppItem> dataMock = [];
    dataMock.add(AppItem("Item一", "", ""));
    dataMock.add(AppItem("Item二", "", ""));
    dataBeans.clear();
    dataBeans.addAll(dataMock);

    int itemCount = 4;
    double itemWidth = 68;
    BuildContext buildContext = context;
    int extraWidht = 18 * 2;
    itemMargin = getGirdViewHorSpacing(buildContext, itemWidth, itemCount, extraWidht);
    hotChildAspectRatio = (68.0 / 90.0);
    return GridView.builder(
        shrinkWrap: true,
        itemCount: dataBeans.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: itemMargin,
            mainAxisSpacing: 24.0,
            childAspectRatio: _getRadio()),
        itemBuilder: (BuildContext context, int index) {
          return _getItem(dataBeans[index]);
        });
  }

  double getGirdViewHorSpacing(BuildContext buildContext, double itemWidth, int itemCount, int extraWidht) {
    return (MediaQuery.of(buildContext).size.width - itemWidth * itemCount - extraWidht) / (itemCount - 1);
  }

  Widget _getItem(AppItem itemBean) {
    return GestureDetector(
      child: Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[
            TextImgWidget(
              itemBean.name,
              'https://image.uc.cn/s/uae/g/3u/files/novel/pic.png',
            ),
          ],
        ),
      ),
      onTap: () {
        //打开对应的页面页面
      },
    );
  }
}


typedef TapCallback = void Function();

class TextImgWidget extends StatelessWidget {

  final String text;
  final String imgUrl;
  final TapCallback tabCallBack;

  TextImgWidget(this.text,
      this.imgUrl, {  Key key, this.tabCallBack,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tabCallBack != null) {  tabCallBack();  }
      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.grey,
              border: Border.all(color: Colors.grey, width: 0.5),borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(borderRadius: BorderRadius.circular(12),
              child: Image.network(imgUrl, width: 60.0, height: 60.0, fit: BoxFit.fill,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Text(text, softWrap: false, overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 13, color: Colors.black),),
          )
        ],
      ),
    );
  }
}
