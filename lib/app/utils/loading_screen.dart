import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: Colors.blue,
                strokeWidth: 5,
              ),
               const SizedBox(height: 16),
      const Text(
        'Loading...',
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
            ],

          )

          // CircularProgressIndicator(
          //   color: Colors.blue,
          //   strokeWidth: 5,
          // ),
          // Text(
          //   'Loading...',
          //   style: TextStyle(fontSize: 20, color: Colors.blue),
            
          // ),
        ),
      ),
    );
  }
}
