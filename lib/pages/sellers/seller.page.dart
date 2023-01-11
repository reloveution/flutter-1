import 'package:flutter/material.dart';
import 'package:rest/models/seller_model.dart';
// import './seller_widgets/'

// import widgets
import './widgets/seller.widget.dart';

class SellerInfoPage extends StatefulWidget {
  const SellerInfoPage({
    super.key,
    required SellerModel sellerModel,
  }) : _sellerModel = sellerModel;

  final SellerModel _sellerModel;
  final String title = 'SellerInfo page';

  @override
  State<SellerInfoPage> createState() => _SellerInfoPageState();
}

// class _SellerInfoPageState extends State<SellerInfoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title
//             // "Sallers page" ${widget._sellerModel.id}
//             ),
//       ),
//       body: SellerWidget('Seller Id', widget._sellerModel.id),
//     );
//   }
// }

class _SellerInfoPageState extends State<SellerInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title
              // "Sallers page" ${widget._sellerModel.id}
              ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SellerWidget('DB entry ID:', widget._sellerModel.id),
            SellerWidget('Seller ID:', widget._sellerModel.sellerId),
            SellerWidget('Name:', widget._sellerModel.sellerInfo?.firstName),
            SellerWidget('Lastname:', widget._sellerModel.sellerInfo?.lastName),
            SellerWidget('email:', widget._sellerModel.sellerInfo?.email)
            // SellerEditButtonWidget()
          ],
        ));
  }
}
