import 'package:flutter/material.dart';

// import widgets
import 'widgets/sellers_list.widget.dart';

// import dialogs
import '../dialogs/resultGetDbDialod.dart';

// import libs
import '../../api/seller_api.dart';
import '../../models/seller_model.dart';

class SellersPage extends StatefulWidget {
  final String title = 'Sellers page';

  const SellersPage({
    super.key,
  });

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> with RouteAware {
  SellerApi sellerApi = SellerApi();
  List<SellerModel> sellersList = [];
  dynamic failMsg = [];

  void _fillSellersList() {
    sellerApi.getSellers().then((response) {
      setState(() {
        sellersList = response;
      });
    });
  }

  void _fillSellersListWithCallback() {
    sellerApi.getSellersWithCallback(
      (_sellersList) => {
        setState(() {
          sellersList = _sellersList;
        }),
      },
      (msg) => {
        setState(() {
          failMsg = msg;
          sellersList = [];
        }),
      },
    );
  }

  void _fillSellersListWith2Callbacks() {
    sellerApi.getSellersWith2Callbacks(
      (slrsList, msg) => {
        setState(() {
          if (msg != null) {
            failMsg = msg;
          } else {
            sellersList = slrsList ?? [];
          }
        })
      },
    );
  }

// void _showSimpleDialog() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return SimpleDialog(
//             title: Text('Chosse an Option'),
//             children: <Widget>[
//               SimpleDialogOption(
//                 onPressed: () {
//                   _dismissDialog();
//                 },
//                 child: const Text('Option 1'),
//               ),
//               SimpleDialogOption(
//                 onPressed: () {
//                   _dismissDialog();
//                 },
//                 child: const Text('Option 2'),
//               ),
//               SimpleDialogOption(
//                 onPressed: () {
//                   _dismissDialog();
//                 },
//                 child: const Text('Option 3'),
//               ),
//               SimpleDialogOption(
//                 onPressed: () {
//                   _dismissDialog();
//                 },
//                 child: const Text('Option 4'),
//               ),
//             ],
//           );
//         });
//   }

  @override
  void initState() {
    super.initState();
    _fillSellersList();
  }

  @override
  void didPopNext() {
    // _fillSellersList();
  }

  @override
  void didPush() {
    // _fillSellersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SellersListWidget(
        sellersListIn: sellersList,
        onSellerChanged: (sellerModel) {
          // _fillSellersList();
          _fillSellersListWithCallback();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _fillSellersListWithCallback();
          _fillSellersListWith2Callbacks();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.agriculture_rounded),
      ),
    );
  }
}
