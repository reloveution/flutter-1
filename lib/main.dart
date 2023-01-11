import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// import pages
import './pages/home_page.dart';
import './pages/sellers/sellers.page.dart';
import 'pages/sellers/seller.page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sellers': (context) => SellersPage(),
        // '/sellersInfo': (context) => SellerInfoPage()
      },
    );
  }
}
