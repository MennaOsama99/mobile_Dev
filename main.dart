import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // 👇 This removes the debug banner
      //debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 📌 Left icon (menu)
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Action when menu is tapped
            // Example: open a drawer or show a message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu tapped!')),
            );
          },
          tooltip: 'Menu',
        ),
        // 📌 Centered title
        title: const Center(
          child: Text('My App Bar'),
        ),
        // 📌 Right icon (back)
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Action when back is tapped
              // Example: go back to previous screen
              Navigator.pop(context);
            },
            tooltip: 'Back',
          ),
        ],
      ),
      // Body – just a placeholder
      body: const Center(
        child: Text(
          'Body content goes here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
