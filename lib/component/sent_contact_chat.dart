import 'package:flutter/material.dart';

class SendContact extends StatelessWidget {
  final List<String> contacts = [
    "John Doe",
    "Jane Smith",
    "Michael Brown",
    "Emily Davis"
  ];

  SendContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Contact'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index]),
            onTap: () {
              // Pop the screen and return the selected contact
              Navigator.pop(context, contacts[index]);
            },
          );
        },
      ),
    );
  }
}
