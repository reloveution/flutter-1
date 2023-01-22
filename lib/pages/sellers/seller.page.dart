import 'package:flutter/material.dart';
import 'package:rest/models/seller_model.dart';
import 'package:rest/pages/dialogs/resultGetDbDialod.dart';
import './widgets/seller_edit.button.dart';
import './widgets/seller_delete.button.dart';
import '../../api/seller_api.dart';

import './widgets/seller.widget.dart';

class SellerInfoPage extends StatefulWidget {
  final SellerModel _sellerModel;
  final String? _id;
  final Function(SellerModel smi) _onSellerChanged;

  SellerInfoPage({
    super.key,
    required SellerModel sellerModel,
    required Function(SellerModel smi) onSellerChanged,
  })  : _sellerModel = sellerModel,
        _onSellerChanged = onSellerChanged,
        _id = sellerModel.id;

  @override
  State<SellerInfoPage> createState() => _SellerInfoPageState();
}

class _SellerInfoPageState extends State<SellerInfoPage> {
  /* Widget State -- Dynamic*/
  /* Start variable initial states*/
  bool sellerDeleted = false;
  bool isEditable = false;
  String title = 'SellerInfo page';
  String firstName = '';
  String lastName = '';
  String email = '';
  String id = '';
  String sellerId = '';

  void _stepBack() {
    Navigator.of(context).pop();
  }

  // void _stepBack2() {
  //   Navigator.of(context).pop();
  //   Navigator.of(context).pop();
  // }

  void showDialogWithResult(String _titleText, String _contentText) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ResultGetDbDialog(
            titleText: _titleText, contentText: _contentText);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    firstName = widget._sellerModel.sellerInfo?.firstName ?? '';
    lastName = widget._sellerModel.sellerInfo?.lastName ?? '';
    email = widget._sellerModel.sellerInfo?.email ?? '';
    id = widget._sellerModel.id ?? '';
    sellerId = widget._sellerModel.sellerId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SellerWidget(
              title: 'First name',
              value: firstName,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            SellerWidget(
              title: 'Last name',
              value: lastName,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            SellerWidget(
              title: 'Email',
              value: email,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SellerWidget(
              title: 'Id',
              value: id,
              isEditable: false,
              onChanged: (value) {
                setState(() {
                  id = value;
                });
              },
            ),
            SellerWidget(
              title: 'sellerId',
              value: id,
              isEditable: false,
              onChanged: (value) {
                setState(() {
                  sellerId = value;
                });
              },
            ),
            if (!isEditable)
              SellerEditButtonWidget(
                callback: () {
                  setState(() {
                    isEditable = !isEditable;
                  });
                },
                statusCallback: (stroke) {
                  setState(() {
                    title = stroke;
                  });
                },
              ),
            if (isEditable)
              ElevatedButton(
                  onPressed: () {
                    if ((widget._sellerModel.sellerInfo?.email != email) ||
                        (widget._sellerModel.sellerInfo?.firstName !=
                            firstName) ||
                        (widget._sellerModel.sellerInfo?.lastName !=
                            lastName)) {
                      SellerApi sellerApi = SellerApi();
                      final SellerModel smi = widget._sellerModel.copyWith(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                      );
                      // sellerApi.patchSeller(smi);
                      sellerApi.patchSellerWith2Callbacks(smi,
                          (response, errResp) {
                        if (response == null) {
                          showDialogWithResult('Fail', errResp);
                        } else {
                          showDialogWithResult('Everything', 'success');
                        }
                      });
                      widget._onSellerChanged(smi);
                      // showDialogWithResult('Chekiryak', 'Myak');

/////////////////////////////////////////////////
                      // _stepBack();
                    }
///////////////////////////////////////////////
                  },
                  child: Text('Patch', style: TextStyle(fontSize: 22))),
            // children: ResultGetDbDialog();
            ElevatedButton(
                onPressed: () {
                  SellerApi sellerApi = SellerApi();
                  sellerApi.deleteSeller(widget._sellerModel.id);
                  final SellerModel smi = widget._sellerModel.copyWith(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                  );
                  widget._onSellerChanged(smi);
                  _stepBack();
                },
                child: Text('Delete', style: TextStyle(fontSize: 22))),
//////////////// popup dialog button
            // TextButton(
            //   onPressed: (() {
            //     showDialogWithResult();
            //   }

            //       // () => showDialog<String>(
            //       //   context: context,
            //       //   builder: (BuildContext context) => AlertDialog(
            //       //     title: const Text('AlertDialog Title'),
            //       //     content: const Text('AlertDialog description'),
            //       //     actions: <Widget>[
            //       //       TextButton(
            //       //         onPressed: () => Navigator.pop(context, 'Cancel'),
            //       //         child: const Text('Cancel'),
            //       //       ),
            //       //       TextButton(
            //       //         onPressed: () => Navigator.pop(context, 'OK'),
            //       //         child: const Text('OK'),
            //       //       ),
            //       //     ],
            //       //   ),
            //       ),
            //   child: const Text('Show Dialog'),
            // )
          ],
        ));
  }
}
