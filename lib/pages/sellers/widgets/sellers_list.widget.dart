import 'package:flutter/material.dart';
import 'package:rest/pages/sellers/seller.page.dart';
import '../../../models/seller_model.dart';

class SellersListWidget extends StatelessWidget {
  final List<SellerModel> sellersList;

  final Function(SellerModel sellerModel) _onSellerChanged;

  onSellerChanged() {}

  SellersListWidget({
    required List<SellerModel> sellersListIn,
    required Function(SellerModel sellerModel) onSellerChanged,
  })  : sellersList = sellersListIn,
        _onSellerChanged = onSellerChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.sellersList.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
              onPressed: () {
                SellerModel sellerModel = this.sellersList[index];
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) {
                    return SellerInfoPage(
                        sellerModel: sellerModel,
                        onSellerChanged: ((smi) {
                          _onSellerChanged(smi);
                        }));
                  },
                );
                Navigator.push(context, route);
              },
              child: Text('email: ${this.sellersList[index].sellerInfo?.email}',
                  style: TextStyle(fontSize: 22)));
        });
  }
}
