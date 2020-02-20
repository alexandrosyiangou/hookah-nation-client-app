import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Navigation and/or Drawer')
      ),
      drawer: Drawer(
        child: ListView(
          children: ['Home', 'Brands', 'Tobaccos', 'Mixes'].map((option) => ListTile(
            title: Text(option)
          )).toList(),
        ),
      ),
      body: ListView(
        children: ['Home', 'Brands', 'Tobaccos', 'Mixes'].map((option) => Card(
          child: Center(
            heightFactor: 5,
            child: Text(option)
          ),
        )).toList(),
      ),
    );
  }
}
