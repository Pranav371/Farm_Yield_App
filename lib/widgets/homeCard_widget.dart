import 'package:flutter/material.dart';

class HomecardWidget extends StatelessWidget {
  const HomecardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(120, 180, 120, 0.363),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title'),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.start,  children: [Text('Value'), SizedBox(width: 8.0), Text('Unit')]),
          ],
        ),
      ),
    );
  }
}
