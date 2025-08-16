import 'package:flutter/material.dart';

class YieldPage extends StatefulWidget {
  const YieldPage({super.key});

  @override
  State<YieldPage> createState() => _YieldPageState();
}

class _YieldPageState extends State<YieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Workers Page"))
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Yields Data")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        
      },
      icon: Icon(Icons.add),
      label: Text('Add Yield')),
    );
  }
}