import 'package:flutter/material.dart';
import 'package:rest/pages/buyers/buyer.page.dart';
import '../../../models/buyer_model.dart';

class BuyerEditButtonWidget extends StatelessWidget {
  final Function() _callback;
  final Function(String value) _statusCallback;
  const BuyerEditButtonWidget(
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
