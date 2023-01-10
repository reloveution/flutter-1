import 'package:flutter/material.dart';
import '../../../models/seller_model.dart';

// class Todo {
//   final String title;
//   final String description;

//   Todo(this.title, this.description);
// }

class SellersListWidget extends StatelessWidget {
  final List<SellerModel> sellersList;

  SellersListWidget(this.sellersList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: this.sellersList.length,
        itemBuilder: (BuildContext context, int index) {
          return Text('ID ${this.sellersList[index].sellerInfo?.email}',
              style: TextStyle(fontSize: 22));
        });
  }
}
