import 'package:flutter/material.dart';
import 'package:rest/pages/sellers/seller.page.dart';
import '../../../models/seller_model.dart';

class SellerEditButtonWidget extends StatelessWidget {
  // final List<SellerModel> sellersList;
  // bool? editEnabled;
  final Function() _callback;
  final Function() _statusCallback;
  const SellerEditButtonWidget(
      {super.key,
      required Function() callback,
      required Function() statusCallback})
      : _callback = callback,
        _statusCallback = statusCallback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/sellersInfo');
          // Navigator.pushNamed(
          //   context,
          //   '/sellersInfo',
          //   arguments: <String, SellerModel>{
          //     // 'rec ID': this.sellersList[index].id,
          //     'seller': this.sellersList[index]
          //   },
          // );
          // Navigator.pushNamedAndRemoveUntil(
          // context, '/sellers', (route) => true);
          // editEnabled = true;
          // print(editEnabled);
          // Navigator.pushReplacementNamed(context, '/sellers');
          _callback();
          _statusCallback();
        },
        child: Text('EDIT NOW!!', style: TextStyle(fontSize: 22)));
  }
}
