import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebView',
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // 初始化 WebView
    _initializeWebView();
  }

  void _initializeWebView() {
    // 必須在 initState 中初始化 WebView 控制器
    if (WebViewPlatform.instance != null) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted) // 啟用 JavaScript
        ..loadRequest(Uri.parse('https://food-vue.onrender.com')); // 載入URL
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Flutter佈局组件
      appBar: AppBar(title: Text('WebView Example')),
      body: WebViewWidget(controller: _controller),//將WebViewController傳给WebViewWidget
    );
  }
}
