import 'package:flutter/material.dart';
import 'package:todo/Models/person_model.dart';
import 'package:todo/Screens/add_contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PersonModel> persons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My notes'),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: persons.length,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(persons[index].name),
                Text(persons[index].mobileNo),
                Text(persons[index].email),
              ],
            ),
          ),
        ),
      ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newContact = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddContactScreen()));

          if (newContact != null) {
            setState(() {
              persons.add(newContact);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
