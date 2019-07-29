import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  ContactHelper helper = ContactHelper();



  //Esse metodo é invocado quando a pagina for criada
  @override
  void initState() {
    super.initState();
    // Contact c = Contact();
    // c.name = "name"; 
    // c.email = "email"; 
    // c.img = "img"; 
    // c.phone = "phone"; 
    // helper.saveContact(c);
    helper.getAllContacts().then((list){
        print(list);


    });


  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
