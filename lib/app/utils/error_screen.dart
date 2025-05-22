import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(
          child: Text(
            'Error: ${FirebaseException(message: "Failed to initialize Firebase", plugin: 'Gagal')}',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
