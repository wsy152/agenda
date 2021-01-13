import 'package:agenda/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();
/*
    Contact c = Contact();
    c.name = 'Edvaldo';
    c.email = 'edypaulista@gmail.com';
    c.phone = '9 8153 - 0811';
    c.img = 'testeimagem';
    helper.saveContact(c);
    */

    helper.getAllContacts().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
