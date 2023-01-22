import 'package:flutter/material.dart';

class ResultGetDbDialog extends StatelessWidget {
  ResultGetDbDialog({required String titleText, required String contentText})
      : _titleText = titleText,
        _contentText = contentText;

  final String? _titleText, _contentText;

  // SellerInfoPage({
  //   super.key,
  //   required SellerModel sellerModel,
  //   required Function(SellerModel smi) onSellerChanged,
  // })  : _sellerModel = sellerModel,
  //       _onSellerChanged = onSellerChanged,
  //       _id = sellerModel.id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_titleText ?? 'Operation complete'),
      content: Text(_contentText ?? 'Everything all right'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'OK'),
            Navigator.of(context).pop()
            // stepback;
            // widget._stepback();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
