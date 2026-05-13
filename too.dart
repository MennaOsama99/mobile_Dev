import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Task List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List of tasks – each task is a Map with 'title' and 'status'
  List<Map<String, dynamic>> tasks = [];

  // Controller for the text field
  final TextEditingController _controller = TextEditingController();

  // Add a new task with default status = false (unchecked)
  void _addTask() {
    if (_controller.text.trim().isEmpty) return; // ignore empty input
    setState(() {
      tasks.add({
        'title': _controller.text,
        'status': false,
      });
      _controller.clear(); // clear the input field
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input row: TextField + Add Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a new task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add Task'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Scrollable task list – Expanded makes it fill remaining space
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Row(
                    children: [
                      // Checkbox toggles the status
                      Checkbox(
                        value: task['status'],
                        onChanged: (bool? newValue) {
                          setState(() {
                            task['status'] = newValue ?? false;
                          });
                        },
                      ),
                      // Task title with dynamic color:
                      // green if status == true, else black
                      Expanded(
                        child: Text(
                          task['title'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: task['status'] ? Colors.green : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
