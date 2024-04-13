import 'package:flutter/material.dart';
import 'package:todo/Models/person_model.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  //
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add New Contact'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameController,
            ),
            const SizedBox(
              height: 10,
            ),

            //
            const Text('Mobile'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _mobileController,
            ),
            const SizedBox(
              height: 10,
            ),

            //
            const Text('Email'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),

            //
            const Text('DOB'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _dobController,
            ),
            const SizedBox(
              height: 10,
            ),

            Center(
              child: ElevatedButton(
                onPressed: _nameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _mobileController.text.isEmpty ||
                        _dobController.text.isEmpty
                    ? () {}
                    : () {
                        Navigator.of(context).pop(PersonModel(
                            name: _nameController.text,
                            mobileNo: _mobileController.text,
                            email: _emailController.text,
                            dob: _dobController.text));
                      },
                child: const Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
