import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:easytbk/easytbk.dart' as easytbk;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initTradeService();
  }

  // 初始化阿里百川
  Future<void> initTradeService() async {
     print("阿里百川授权开始");
    await easytbk.initTradeAsync(debuggable: false).then((data) {
      print(data);
      print("阿里百川授权结束");
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await easytbk.platformVersion();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              FlatButton(
                onPressed: () {
                  easytbk.login().then((data) {
                    print(data);
                  });
                },
                child: Text("淘宝授权"),
              ),
              FlatButton(
                onPressed: () {
                  easytbk.openItemDetail(
                    itemID: "590134648441",
                    taoKeParams: easytbk.TaoKeParams(
                      unionId: "",
                      subPid: "mm_1111_222_333",
                      pid: "mm_1111_222_333",
                      adzoneId: "1234",
                    ),
                  );
                },
                child: Text("打开淘宝详情"),
              ),
              FlatButton(
                onPressed: () {
                  easytbk.openUrl(
                    pageUrl: "https://m.taobao.com",
                    taoKeParams: easytbk.TaoKeParams(
                      unionId: "",
                      subPid: "mm_1111_222_333",
                      pid: "mm_1111_222_333",
                      adzoneId: "1234",
                    ),
                  );
                },
                child: Text("打开淘宝Url"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
