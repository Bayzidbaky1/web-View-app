import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pepsi BD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = WebViewController();
  loadStore() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.grey)
      ..loadRequest(Uri.parse('https://ustrading.xyz/'));
  }

  @override
  void initState() {
    loadStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff010A33),
        centerTitle: true,
        title: Text(
          'Us Trading',
        ),
        leading: IconButton(
            onPressed: () async {
              if (await controller.canGoBack()) {
                return controller.goBack();
              } else {
                return null;
              }
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
