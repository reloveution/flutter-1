import 'package:flutter/material.dart';

// import widgets
import 'widgets/buyers_list.widget.dart';

// import dialogs
import '../dialogs/resultGetDbDialod.dart';

// import libs
// import '../../api/buyer_api.dart';
import '../../api/buyer_dio_api.dart';
import '../../models/buyer_model.dart';

class BuyersPage extends StatefulWidget {
  final String title = 'Buyers page';

  const BuyersPage({
    super.key,
  });

  @override
  State<BuyersPage> createState() => _BuyersPageState();
}

class _BuyersPageState extends State<BuyersPage> with RouteAware {
  // BuyerApi buyerApi = BuyerApi();
  BuyerApiByDio buyerApi = BuyerApiByDio();
  List<BuyerModel> buyersList = [];
  dynamic failMsg = [];

  // void _fillBuyersList() {
  //   buyerApi.getBuyers().then((response) {
  //     setState(() {
  //       buyersList = response;
  //     });
  //   });
  // }///////////////////

  // void _fillBuyersListWithCallback() {
  //   buyerApi.getBuyersWithCallback(
  //     (_buyersList) => {
  //       setState(() {
  //         buyersList = _buyersList;
  //       }),
  //     },
  //     (msg) => {
  //       setState(() {
  //         failMsg = msg;
  //         buyersList = [];
  //       }),
  //     },
  //   );
  // }///////////////////

  void _fillBuyersListWith2Callbacks() {
    // buyerApi.getBuyersWith2Callbacks(
    buyerApi.getBuyersWith2Callbacks(
      (byrsList, msg) => {
        setState(() {
          if (msg != null) {
            failMsg = msg;
          } else {
            buyersList = byrsList ?? [];
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

  // @override
  // void initState() {
  //   super.initState();
  //   _fillBuyersList();
  // }///////////////////
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
      body: BuyersListWidget(
        buyersListIn: buyersList,
        onBuyerChanged: (buyerModel) {
          // _fillSellersList();
          // _fillBuyersListWithCallback();///////////////////
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _fillSellersListWithCallback();
          _fillBuyersListWith2Callbacks();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.agriculture_rounded),
      ),
    );
  }
}
