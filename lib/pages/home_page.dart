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
      ),
      body: Column(children: [
        Text('This is Homepage', style: TextStyle(color: Colors.blueGrey)),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sellers');
            },
            child: Text('Sellers List')),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/buyers');
            },
            child: Text('Buyers List'))
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
