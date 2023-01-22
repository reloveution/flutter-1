import 'package:flutter/material.dart';
import 'package:rest/pages/buyers/buyer.page.dart';
import '../../../models/buyer_model.dart';

class BuyersListWidget extends StatelessWidget {
  final List<BuyerModel> buyersList;

  final Function(BuyerModel buyerModel) _onBuyerChanged;

  BuyersListWidget({
    required List<BuyerModel> buyersListIn,
    required Function(BuyerModel buyerModel) onBuyerChanged,
  })  : buyersList = buyersListIn,
        _onBuyerChanged = onBuyerChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.buyersList.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
              onPressed: () {
                BuyerModel buyerModel = this.buyersList[index];
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) {
                    return BuyerInfoPage(
                        buyerModel: buyerModel,
                        onBuyerChanged: ((bmi) {
                          _onBuyerChanged(bmi);
                        }));
                  },
                );
                Navigator.push(context, route);
              },
              child: Text('email: ${this.buyersList[index].email}',
                  style: TextStyle(fontSize: 22)));
        });
  }
}
