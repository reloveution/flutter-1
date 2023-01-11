// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String title = 'Home page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {
        //       _menuOpen(context);
        //     },
        //   ),
        // ],
      ),
      body: Column(children: [
        Text('This is Homepage', style: TextStyle(color: Colors.blueGrey)),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sellers');

              // Navigator.pushNamedAndRemoveUntil(
              // context, '/sellers', (route) => true);

              // Navigator.pushReplacementNamed(context, '/sellers');
            },
            child: Text('Sellers List'))
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// void _menuOpen(BuildContext context) {
//   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Menu'),
//         ),
//         body: Text('OCHOBA'));
//   }));
// }













// // import widgets
// import '../widgets/seller_widgets/sellers_list_widget.dart';

// // import libs
// import '../api/seller_api.dart';
// import '../models/seller_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // int _counter = 0;
//   List<SellerModel> sellersList = [];
//   SellerApi sellerApi = SellerApi();
//   // Viewer view = new Viewer();

//   void _incrementCounter() {
//     sellerApi.getSellers().then((response) {
//       setState(() {
//         sellersList = response;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SellersListWidget(sellersList),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.agriculture_rounded),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
