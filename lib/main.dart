import 'package:flutter/material.dart';
import 'package:http/http.dart';

// import widgets
import 'package:rest/widgets/SellersListWidget.dart';

// import libs
import 'api/sellerApi.dart';
import 'models/sellerModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'List of sellers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<SellerModel> sellersList = [];
  SellerApi sellerApi = SellerApi();
  // Viewer view = new Viewer();

  void _incrementCounter() {
    sellerApi.getSellers().then((response) {
      setState(() {
        sellersList = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SellersListWidget(sellersList),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.agriculture_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
