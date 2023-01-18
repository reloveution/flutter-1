import 'package:flutter/material.dart';
import 'package:rest/pages/sellers/seller.page.dart';
import '../../../api/seller_api.dart';

class SellerDeleteButtonWidget extends StatelessWidget {
  final Function() _callback;
  final Function(String id) _deleteSellerCallback;
  const SellerDeleteButtonWidget(
      {super.key,
      required Function() callback,
      required Function(String id) deleteSellerCallback})
      : _callback = callback,
        _deleteSellerCallback = deleteSellerCallback;

  void _deleteSeller(String id) {
    SellerApi sellerApi = new SellerApi();
    sellerApi.deleteSeller(id).then((response) {});
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
