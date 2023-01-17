import 'package:flutter/material.dart';
import 'package:rest/models/seller_model.dart';
import './widgets/seller_edit.button.dart';
import './widgets/seller_delete.button.dart';
import '../../api/seller_api.dart';

// import widgets
import './widgets/seller.widget.dart';

class SellerInfoPage extends StatefulWidget {
  final SellerModel _sellerModel;
  final String? _id;

  SellerInfoPage({
    super.key,
    required SellerModel sellerModel,
  })  : _sellerModel = sellerModel,
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
        appBar: AppBar(title: Text(title), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                isEditable = !isEditable;
              });
            },
          ),
        ]),
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
            // if (!sellerDeleted)
            //   SellerDeleteButtonWidget(
            //     // deleteSellerCallback: () {
            //     //   setState(() {
            //     //     SellerApi sellerApi = new SellerApi();
            //     //     sellerApi.deleteSeller(widget._sellerModel.id);
            //     //   });
            //     // }
            //     callback: () {
            //       setState(() {
            //         sellerDeleted = !sellerDeleted;
            //       });
            //     },
            //     statusCallback: (stroke) {
            //       setState(() {
            //         title = stroke;
            //       });
            //     },
            //   ),
            ElevatedButton(
                onPressed: () {
                  SellerApi sellerApi = SellerApi();
                  sellerApi.deleteSeller(widget._sellerModel.id);
                },
                child: Text('Delete', style: TextStyle(fontSize: 22))),
            ElevatedButton(
                onPressed: () {
                  SellerApi sellerApi = SellerApi();
                  final SellerModel smi = widget._sellerModel.copyWith(
                    firstName: firstName,
                    lastName: lastName,
                    email: email,
                  );
                  sellerApi.patchSeller(smi);
                },
                child: Text('Patch', style: TextStyle(fontSize: 22))),
          ],
        ));
  }
}
