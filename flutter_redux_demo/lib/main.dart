import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  Store<int> store1 = new Store<int>(mainResucer, initialState: 0);
  runApp(MyApp(store1));
}

int mainResucer(int state, dynamic action) {
  if(Actions.Increase == action){
    return state + 1;
  }
  return state;
}

enum Actions {
  Increase,
}

class MyApp extends StatelessWidget {

  final Store<int> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(store: store, child: new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new StoreConnector(builder: (BuildContext context, int counter) {
        return MyHomePage(title: 'Flutter Deom', counter : counter);
      }, converter: (Store<int> store) {
        return store.state;
      }),
    ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.counter}) : super(key: key);

  final String title;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Redux Use'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            Text('$counter', style: Theme.of(context).textTheme.display1,),
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<int, VoidCallback>(builder: (BuildContext context, VoidCallback callback) {
        return new FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: new Icon(Icons.add));
      }, converter: (Store<int> store) {
        return ()=>store.dispatch(Actions.Increase);
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}