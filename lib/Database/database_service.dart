import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/Models/person_model.dart';

class DatabaseService {
  Future<Database> getDatabase() async {
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, 'contacts.db');

    final appDb = await sql.openDatabase(dbPath, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE contact_list (id INTEGER PRIMARY KEY, name TEXT, mobileno TEXT, email TEXT, dob TEXT)');
    }, version: 1);
    return appDb;
  }

  //LIKE - READ
  Future<List<PersonModel>> getContacts() async {
    final appDb = await getDatabase();
    final table = await appDb.query('contact_list');

    final contactList = table
        .map((row) => PersonModel(
              name: row['name'] as String,
              mobileNo: row['mobileno'] as String,
              email: row['email'] as String,
              dob: row['dob'] as String,
            ))
        .toList();
    return contactList;
  }

  //LIKE WRITE - INSERT
  Future addContact(PersonModel newContact) async {
    final appDb = await getDatabase();
    await appDb.insert('contact_list', {
      "name": newContact.name,
      "mobileno": newContact.mobileNo,
      "email": newContact.email,
      "dob": newContact.dob,
    });
  }
}
