import 'package:flutter/material.dart';
import 'package:rest/models/buyer_model.dart';
import 'package:rest/pages/dialogs/resultGetDbDialod.dart';
import './widgets/buyer_edit.button.dart';
import './widgets/buyer_delete.button.dart';
import '../../api/buyer_api.dart';

import './widgets/buyer.widget.dart';

class BuyerInfoPage extends StatefulWidget {
  final BuyerModel _buyerModel;
  final String? _id;
  final Function(BuyerModel bmi) _onBuyerChanged;

  BuyerInfoPage({
    super.key,
    required BuyerModel buyerModel,
    required Function(BuyerModel bmi) onBuyerChanged,
  })  : _buyerModel = buyerModel,
        _onBuyerChanged = onBuyerChanged,
        _id = buyerModel.id;

  @override
  State<BuyerInfoPage> createState() => _BuyerInfoPageState();
}

class _BuyerInfoPageState extends State<BuyerInfoPage> {
  /* Widget State -- Dynamic*/
  /* Start variable initial states*/
  bool buyerDeleted = false;
  bool isEditable = false;
  String title = 'BuyerInfo page';
  String firstName = '';
  String lastName = '';
  String dob = '';
  String phone = '';
  String email = '';
  String id = '';

  void _stepBack() {
    Navigator.of(context).pop();
  }

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
    firstName = widget._buyerModel.firstName ?? '';
    lastName = widget._buyerModel.lastName ?? '';
    email = widget._buyerModel.email ?? '';
    id = widget._buyerModel.id ?? '';
    phone = widget._buyerModel.phone ?? '';
    dob = widget._buyerModel.dob.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            BuyerWidget(
              title: 'First name',
              value: firstName,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            BuyerWidget(
              title: 'Last name',
              value: lastName,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            BuyerWidget(
              title: 'Date of birthday',
              value: dob,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  dob = value;
                });
              },
            ),
            BuyerWidget(
              title: 'Phone',
              value: phone,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              },
            ),
            BuyerWidget(
              title: 'Email',
              value: email,
              isEditable: isEditable,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            BuyerWidget(
              title: 'Id',
              value: id,
              isEditable: false,
              onChanged: (value) {
                setState(() {
                  id = value;
                });
              },
            ),
            if (!isEditable)
              BuyerEditButtonWidget(
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
                    if ((widget._buyerModel.email != email) ||
                        (widget._buyerModel.firstName != firstName) ||
                        (widget._buyerModel.lastName != lastName) ||
                        (widget._buyerModel.dob != DateTime.parse(dob)) ||
                        (widget._buyerModel.phone != phone)) {
                      BuyerApi buyerApi = BuyerApi();
                      final BuyerModel bmi = widget._buyerModel.copyWith(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        dob: DateTime.parse(dob),
                        phone: phone,
                      );
                      buyerApi.patchBuyerWith2Callbacks(bmi,
                          (response, errResp) {
                        if (response == null) {
                          showDialogWithResult('Fail', errResp.toString());
                        } else {
                          showDialogWithResult('Everything', 'success');
                        }
                      });
                      widget._onBuyerChanged(bmi);
                    }
///////////////////////////////////////////////
                  },
                  child: Text('Patch', style: TextStyle(fontSize: 22))),
            ElevatedButton(
                onPressed: () {
                  BuyerApi buyerApi = BuyerApi();
                  buyerApi.deleteBuyer(widget._buyerModel.id);
                  final BuyerModel bmi = widget._buyerModel.copyWith(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                    phone: phone,
                    dob: DateTime.parse(dob),
                  );
                  widget._onBuyerChanged(bmi);
                  _stepBack();
                },
                child: Text('Delete', style: TextStyle(fontSize: 22))),
          ],
        ));
  }
}
