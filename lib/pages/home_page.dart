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
