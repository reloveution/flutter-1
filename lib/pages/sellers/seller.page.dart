import 'package:flutter/material.dart';
import 'package:rest/models/seller_model.dart';
import './widgets/seller_edit.button.dart';

// import widgets
import './widgets/seller.widget.dart';

class SellerInfoPage extends StatefulWidget {
  const SellerInfoPage({
    super.key,
    required SellerModel sellerModel,
  }) : _sellerModel = sellerModel;

  final SellerModel _sellerModel;
  // final String title = 'SellerInfo page'; //final states,  not changable

  @override
  State<SellerInfoPage> createState() => _SellerInfoPageState();
}

class _SellerInfoPageState extends State<SellerInfoPage> {
  /* Widget State -- Dynamic*/
  /* Start variable initial states*/

  bool editEnabled = false;
  String title = 'SellerInfo page'; //final states,  not changable

  /* End variable initial states*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title
              // "Sallers page" ${widget._sellerModel.id}
              ),
        ),
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
                'email:', widget._sellerModel.sellerInfo?.email, editEnabled),
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
              )
          ],
        ));
  }
}
