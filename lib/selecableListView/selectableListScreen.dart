import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/selecableListView/selecableListView.dart';

class SelectableListScreen extends StatelessWidget {
  const SelectableListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecable listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ContactList(),
      ),
    );
  }
}


class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [
    Contact('John Doe', false),
    Contact('Jane Smith', false),
    // Add more contacts...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              contacts.forEach((contact) {
                contact.isSelected = false;
              });
              contacts[index].isSelected = true;
            });
          },
          child: ListTile(
            title: Text(contacts[index].name),
            selected: contacts[index].isSelected,
            selectedTileColor: Colors.grey.withOpacity(0.5),
          ),
        );
      },
    );
  }
}


class Contact {
  final String name;
  bool isSelected;

  Contact(this.name, this.isSelected);
}
