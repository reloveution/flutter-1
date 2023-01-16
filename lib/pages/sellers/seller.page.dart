import 'package:flutter/material.dart';
import 'package:rest/models/seller_model.dart';
import './widgets/seller_edit.button.dart';
import './widgets/seller_delete.button.dart';
import '../../api/seller_api.dart';

// import widgets
import './widgets/seller.widget.dart';

class SellerInfoPage extends StatefulWidget {
  SellerInfoPage({
    super.key,
    required SellerModel sellerModel,
  })  : _sellerModel = sellerModel,
        _id = sellerModel.id;

  final SellerModel _sellerModel;
  final String? _id;
  // final String _sellerId;
  // final String title = 'SellerInfo page'; //final states,  not changable

  @override
  State<SellerInfoPage> createState() => _SellerInfoPageState();
}

class _SellerInfoPageState extends State<SellerInfoPage> {
  /* Widget State -- Dynamic*/
  /* Start variable initial states*/
  bool sellerDeleted = false;
  bool editEnabled = false;
  String email = '';
  String title = 'SellerInfo page'; //final states,  not changable
  /* End variable initial states*/

  // deleteSeller() {
  //   SellerApi sellerApi = new SellerApi();
  //   sellerApi.deleteSeller(widget._id).then((response) {
  //     print(widget._id);
  //     // setState(() {
  //     //   // sellersList = response;
  //     // });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                editEnabled = !editEnabled;
              });
            },
          ),
        ]),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SellerWidget('DB entry ID:', widget._sellerModel.id, false),
            SellerWidget('Seller ID:', widget._sellerModel.sellerId, false),
            SellerWidget('Name:', widget._sellerModel.sellerInfo?.firstName,
                editEnabled),
            SellerWidget('Lastname:', widget._sellerModel.sellerInfo?.lastName,
                editEnabled),
            SellerWidget(
              'email:',
              widget._sellerModel.sellerInfo?.email,
              editEnabled,
              textBack: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            if (!editEnabled)
              SellerEditButtonWidget(
                callback: () {
                  setState(() {
                    editEnabled = !editEnabled;
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
                  print(
                      'on patch sellerInfo: ${widget._sellerModel.sellerInfo?.lastName}');
                  print('widget._sellerModel.id: ${widget._sellerModel.id}');

                  final smi = widget._sellerModel;
                  smi.sellerInfo?.email = 'dsgdfg'; //email;

                  sellerApi.patchSeller(smi);
                },
                child: Text('Patch', style: TextStyle(fontSize: 22))),
          ],
        ));
  }
}
