import 'package:flutter/material.dart';
import '../../../models/seller_model.dart';

class SellerWidget extends StatelessWidget {
  final String? sellerRecParam;
  final String? sellerRec;
  final bool editEnabled;

  SellerWidget(
    this.sellerRec,
    this.sellerRecParam,
    this.editEnabled,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.5),
      child: TextField(
          cursorWidth: 8.8,
          enabled: editEnabled,
          decoration: InputDecoration(
              labelText: '${sellerRec} ${sellerRecParam}',
              border: InputBorder.none,
              hintText: '${sellerRec} ${sellerRecParam}',
              fillColor: Colors.grey,
              filled: true)),
    );
  }
}
