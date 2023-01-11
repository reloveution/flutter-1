import 'package:flutter/material.dart';
import '../../../models/seller_model.dart';

class SellerWidget extends StatelessWidget {
  final String? sellerRecParam;
  final String? sellerRec;
  // final bool? editEnabled;
  SellerWidget(this.sellerRec, this.sellerRecParam /*, this.editEnabled*/);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.5),
      child: TextField(
          cursorWidth: 8.8,
          // enabled:
          // editEnabled /*(sellerRec != 'DB entry ID:') && (sellerRec != 'Seller ID:')*/,
          decoration: InputDecoration(
              labelText: '${sellerRec} ${sellerRecParam}',
              border: InputBorder.none,
              hintText: '${sellerRec} ${sellerRecParam}',
              fillColor: Colors.grey,
              filled: true)),
    );
  }
}

// class SellerWidget extends StatelessWidget {
//   final String? sellerRecParam;
//   final String? sellerRec;
//   SellerWidget(this.sellerRec, this.sellerRecParam);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(5.5),
//         child: ElevatedButton(
//             onPressed: () {
//               // SellerModel sellerModel = this.sellersList[index];
//               // MaterialPageRoute route = MaterialPageRoute(
//               // builder: (context) {
//               // return SellerInfoPage(sellerModel: sellerModel);
//               // },
//               // );
//               // Navigator.push(context, route);
//               // Navigator.pushNamed(context, '/sellersInfo');
//               // Navigator.pushNamed(
//               //   context,
//               //   '/sellersInfo',
//               //   arguments: <String, SellerModel>{
//               //     // 'rec ID': this.sellersList[index].id,
//               //     'seller': this.sellersList[index]
//               //   },
//               // );
//               // Navigator.pushNamedAndRemoveUntil(
//               // context, '/sellers', (route) => true);

//               // Navigator.pushReplacementNamed(context, '/sellers');
//             },
//             child: Text('${sellerRec} ${sellerRecParam}',
//                 style: TextStyle(fontSize: 22))));
//   }

// }
