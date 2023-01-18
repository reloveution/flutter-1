import 'package:flutter/material.dart';

// import widgets
import 'widgets/sellers_list.widget.dart';

// import libs
import '../../api/seller_api.dart';
import '../../models/seller_model.dart';

class SellersPage extends StatefulWidget {
  final String title = 'Sellers page';

  const SellersPage({
    super.key,
  });

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> with RouteAware {
  SellerApi sellerApi = SellerApi();
  List<SellerModel> sellersList = [];

  void _fillSellersList() {
    sellerApi.getSellers().then((response) {
      setState(() {
        sellersList = response;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _fillSellersList();
  }

  @override
  void didPopNext() {
    _fillSellersList();
  }

  @override
  void didPush() {
    _fillSellersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SellersListWidget(
        sellersListIn: sellersList,
        onSellerChanged: (sellerModel) {
          _fillSellersList();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fillSellersList,
        tooltip: 'Increment',
        child: const Icon(Icons.agriculture_rounded),
      ),
    );
  }
}
