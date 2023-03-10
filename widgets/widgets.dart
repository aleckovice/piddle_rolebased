import 'package:flutter/material.dart';

Widget purpleButton(BuildContext context, String label) {
  return Container(
    padding: EdgeInsetsDirectional.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.deepPurple, borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
    ),
  );
}
