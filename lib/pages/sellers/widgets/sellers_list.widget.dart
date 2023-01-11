import 'package:flutter/material.dart';
import 'package:rest/pages/sellers/seller_info.page.dart';
import '../../../models/seller_model.dart';

class SellersListWidget extends StatelessWidget {
  final List<SellerModel> sellersList;

  SellersListWidget(this.sellersList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.sellersList.length,
        itemBuilder: (BuildContext context, int index) {
          // return Text('ID ${this.sellersList[index].sellerInfo?.email}',
          // style: TextStyle(fontSize: 22));

          return ElevatedButton(
              onPressed: () {
                SellerModel sellerModel = this.sellersList[index];
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) {
                    return SellerInfoPage(sellerModel: sellerModel);
                  },
                );
                Navigator.push(context, route);
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
              child: Text('ID ${this.sellersList[index].sellerInfo?.email}',
                  style: TextStyle(fontSize: 22)));
        });
  }
}
