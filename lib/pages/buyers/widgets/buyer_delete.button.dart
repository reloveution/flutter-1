import 'package:flutter/material.dart';
import 'package:rest/pages/buyers/buyer.page.dart';
import '../../../api/buyer_api.dart';

class BuyerDeleteButtonWidget extends StatelessWidget {
  final Function() _callback;
  final Function(String id) _deleteBuyerCallback;
  const BuyerDeleteButtonWidget(
      {super.key,
      required Function() callback,
      required Function(String id) deleteBuyerCallback})
      : _callback = callback,
        _deleteBuyerCallback = deleteBuyerCallback;

  void _deleteBuyer(String id) {
    BuyerApi buyerApi = new BuyerApi();
    buyerApi.deleteBuyer(id).then((response) {});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print('khui');
        },
        child: Text('Delete', style: TextStyle(fontSize: 22)));
  }
}
