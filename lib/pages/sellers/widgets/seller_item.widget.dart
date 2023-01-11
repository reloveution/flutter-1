import 'package:flutter/material.dart';
import '../../../models/seller_model.dart';

class SellerWidget extends StatelessWidget {
  final SellerModel sellerModel;
  SellerWidget(this.sellerModel);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // SellerModel sellerModel = this.sellersList[index];
          // MaterialPageRoute route = MaterialPageRoute(
          // builder: (context) {
          // return SellerInfoPage(sellerModel: sellerModel);
          // },
          // );
          // Navigator.push(context, route);
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

          // Navigator.pushReplacementNamed(context, '/sellers');
        },
        child: Text('ID ${this.sellerModel.sellerInfo?.email}',
            style: TextStyle(fontSize: 22)));
  }
}
