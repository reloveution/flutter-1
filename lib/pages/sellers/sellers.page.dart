import 'package:flutter/material.dart';

// import widgets
import 'widgets/sellers_list.widget.dart';

// import libs
import '../../api/seller_api.dart';
import '../../models/seller_model.dart';

class SellersPage extends StatefulWidget {
  const SellersPage({super.key});
  final String title = 'Sellers page';

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  // int _counter = 0;
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
        title: Text(widget.title), // "Sallers page"
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
