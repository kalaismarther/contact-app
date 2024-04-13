import 'package:flutter/material.dart';
import 'package:todo/Database/database_service.dart';
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
  void initState() {
    _getCustomers();
    super.initState();
  }

  void _getCustomers() async {
    final contactlist = await DatabaseService().getContacts();
    setState(() {
      persons = contactlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My notes'),
      ),

      body: persons.isEmpty
          ? const Center(child: Text('No contacts found'))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: persons.length,
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(persons[index].name),
                          Text(persons[index].mobileNo),
                          Text(persons[index].email),
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.phone))
                    ],
                  ),
                ),
              ),
            ),

      //
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddContactScreen()));
          _getCustomers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
