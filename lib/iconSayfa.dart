import 'package:flutter/material.dart';

class Iconwidget extends StatelessWidget {
  //final Function? function;
  final String? textDegisim;
  final IconData? IconDegisim;
  Iconwidget({
    this.textDegisim,
    this.IconDegisim,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconDegisim,
          color: Colors.grey,
          size: 60,
        ),
        Text(
          '$textDegisim',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
        ),
      ],
    );
  }
}
