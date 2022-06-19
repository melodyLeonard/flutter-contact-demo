import 'package:flutter/material.dart';
import './contactBook.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Name",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final contact = Contact(name: _nameController.text);
              ContactBook().addContact(contact: contact);
              Navigator.of(context).pop(_nameController.text);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
