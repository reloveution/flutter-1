import 'package:flutter/material.dart';

class SellerWidget extends StatefulWidget {
  final String _title;
  final String _value;
  final bool _isEditable;
  final Function(String value) _onChanged;

  const SellerWidget({
    super.key,
    required String title,
    required String value,
    required bool isEditable,
    required Function(String value) onChanged,
  })  : _title = title,
        _value = value,
        _isEditable = isEditable,
        _onChanged = onChanged;

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textFieldController.text = widget._value;
    _textFieldController.addListener(() {
      final String text = _textFieldController.text.toLowerCase();
      _textFieldController.value = _textFieldController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  // _SellerWidgetState(this.sellerRec, this.sellerRecParam, this.editEnabled,
  // {super.key, Function(String value)? textBack})
  // : _textBack = textBack;

  @override
  void dispose() {
    _textFieldController.dispose();
  }

  // @override
  // void initState(sellerRecParam) {
  //   _textFieldController.text = sellerRecParam;
  //   _textFieldController.addListener(_changeText);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.5),
        child: TextField(
          cursorWidth: 8.8,
          enabled: widget._isEditable,

/////////////////////////////
          controller: _textFieldController,
/////////////////////////////////
          decoration: InputDecoration(
            labelText: widget._title,
            border: InputBorder.none,
            hintText: 'Enter ${widget._title}',
            fillColor: Colors.grey,
            filled: true,
          ),
          onChanged: (value) {
            widget._onChanged!(value);
            // if (_textBack != null) {
            //   _textBack!(value);
            // }
          },
        ));
  }
}











// class SellerWidget extends StatelessWidget {
//   String? sellerRecParam;
//   final String? sellerRec;
//   final bool editEnabled;
//   final Function(String value)? _textBack;
//   final _textFieldController = TextEditingController();

//   _changeText() {
//     setState(() => _name = _textFieldController.text);
//   }

//   SellerWidget(this.sellerRec, this.sellerRecParam, this.editEnabled,
//       {super.key, Function(String value)? textBack})
//       : _textBack = textBack;

//   @override
//   void dispose() {
//     _textFieldController.dispose();
//   }

//   @override
//   void initState(sellerRecParam) {
//     _textFieldController.text = sellerRecParam;
//     _textFieldController.addListener(_changeText);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(5.5),
//         child: TextField(
//           cursorWidth: 8.8,
//           enabled: editEnabled,

// /////////////////////////////
//           controller: _textFieldController,
// /////////////////////////////////
//           decoration: InputDecoration(
//             labelText: '${sellerRec} ${sellerRecParam}',
//             border: InputBorder.none,
//             hintText: '${sellerRec} ${sellerRecParam}',
//             fillColor: Colors.grey,
//             filled: true,
//           ),
//           onSubmitted: (value) {
//             if (_textBack != null) {
//               _textBack!(value);
//             }
//           },
//         ));
//   }
// }