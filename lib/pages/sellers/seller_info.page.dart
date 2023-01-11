import 'package:flutter/material.dart';
import 'package:rest/models/seller_model.dart';

// import widgets
import './widgets/seller_item.widget.dart';

class SellerInfoPage extends StatefulWidget {
  const SellerInfoPage({
    super.key,
    required SellerModel sellerModel,
  }) : _sellerModel = sellerModel;

  final SellerModel _sellerModel;
  final String title = 'SellerInfo page';

  @override
  State<SellerInfoPage> createState() => _SellerInfoPageState();
}

class _SellerInfoPageState extends State<SellerInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SellerInfo Page', // "Sallers page" ${widget._sellerModel.id}
        ),
      ),
      body: SellerWidget(widget._sellerModel),
    );
  }
}


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title), // "Sallers page"
  //     ),
  //     body: SellersListWidget(sellersList),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _incrementCounter,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.agriculture_rounded),
  //     ), // This trailing comma makes auto-formatting nicer for build methods.
  //   );
