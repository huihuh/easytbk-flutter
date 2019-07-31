# 简单淘客
阿里百川电商SDK在Flutter上的实现，通过它可以实现淘宝登录，打开淘宝商品详情等功能。

## 使用需知
在使用前请详细阅读阿里百川官方文档，安全图片请使用V4的，官方文档比较坑，遇到问题提交工单解决。

## 初始化
```dart
 import 'package:easytbk/easytbk.dart' as easytbk;
 var  result = await easytbk.initTradeAsync();
```

## 淘宝授权登录:
```dart
var result = await easytbk.login();
```

## 获取当用户信息：
```dart
 import 'package:easytbk/easytbk.dart' as easytbk;
 easytbk.User user = await easytbk.getUser();
```

## 查询是否登录：
```dart
 import 'package:easytbk/easytbk.dart' as easytbk;
 bool isLogin = await easytbk.isLogin();
```

## 打开淘宝详情：
```dart 
 import 'package:easytbk/easytbk.dart' as easytbk;
 easytbk.openItemDetail(itemID: "1234567");
```

## 打开淘宝URL
```dart 
 import 'package:easytbk/easytbk.dart' as easytbk;
 easytbk.openUrl(pageUrl: "https://www.taobao.com");
```

## TODO
1. 阿里百川自定义webview
2. 京东联盟SDK
3. 多多进宝SDK

## 联系方式
QQ群：`88852333`
微信：`bugfixed`


## LICENSE

    Copyright 2018 OpenFlutter Project

    Licensed to the Apache Software Foundation (ASF) under one or more contributor
    license agreements.  See the NOTICE file distributed with this work for
    additional information regarding copyright ownership.  The ASF licenses this
    file to you under the Apache License, Version 2.0 (the "License"); you may not
    use this file except in compliance with the License.  You may obtain a copy of
    the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
    License for the specific language governing permissions and limitations under
    the License.
