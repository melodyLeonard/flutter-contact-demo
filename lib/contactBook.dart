import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  Contact({
    required this.name,
  }) : id = const Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstace() : super(const []);
  static final ContactBook _shared = ContactBook._sharedInstace();
  factory ContactBook() => _shared;

  int get count => value.length;

  void addContact({required Contact contact}) {
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void removeContact({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? getContact({required int index}) =>
      value.length > index ? value[index] : null;
}
