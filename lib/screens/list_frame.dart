import 'package:flutter/material.dart';

class ListFrame extends StatelessWidget {
  final String lang;

  const ListFrame(this.lang);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(lang),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange,
        // borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
