import 'package:flutter/material.dart';

class SellerWidget extends StatelessWidget {
  String? sellerRecParam;
  final String? sellerRec;
  final bool editEnabled;
  Function(String value)? _textBack;

  SellerWidget(this.sellerRec, this.sellerRecParam, this.editEnabled,
      {super.key, Function(String value)? textBack})
      : _textBack = textBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.5),
        child: TextField(
          cursorWidth: 8.8,
          enabled: editEnabled,

// /////////////////////////////
          controller: null,
///////////////////////////////////
          decoration: InputDecoration(
            labelText: '${sellerRec} ${sellerRecParam}',
            border: InputBorder.none,
            hintText: '${sellerRec} ${sellerRecParam}',
            fillColor: Colors.grey,
            filled: true,
          ),
          onSubmitted: (value) {
            if (_textBack != null) {
              _textBack!(value);
            }
          },
        ));
  }
}

// onSubmitted: (String str) {
//   setState(() {
//     value = str;
//   });
// },

// void onSubmitted(String value) {
// print(value);
// }
