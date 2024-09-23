import 'package:flutter/material.dart';

void customNotification(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.teal,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0), // 원하는 둥근 정도로 설정
    ),
    margin: const EdgeInsets.all(10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
