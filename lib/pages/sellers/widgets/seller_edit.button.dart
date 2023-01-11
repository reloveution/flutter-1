import 'package:flutter/material.dart';
import 'package:rest/pages/sellers/seller.page.dart';
import '../../../models/seller_model.dart';

class SellerEditButtonWidget extends StatelessWidget {
  final Function() _callback;
  final Function(String value) _statusCallback;
  const SellerEditButtonWidget(
      {super.key,
      required Function() callback,
      required Function(String value) statusCallback})
      : _callback = callback,
        _statusCallback = statusCallback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _callback();
          _statusCallback('YoYoYo');
        },
        child: Text('EDIT NOW!!', style: TextStyle(fontSize: 22)));
  }
}
