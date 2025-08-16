import 'package:farm_yield/data/constants.dart';
import 'package:farm_yield/widgets/alertDialog_widget.dart';
import 'package:flutter/material.dart';

class WorkerWidget extends StatelessWidget {
  const WorkerWidget({super.key});

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',style:WorkersTextConstants.titleText ,),
                    SizedBox(height: 10.0),
                    Text("Phone Number",style: WorkersTextConstants.phoneText,),
                  ],
                ),
                IconButton(onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertdialogWidget();
                  },);
                }, icon: Icon(Icons.edit))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
