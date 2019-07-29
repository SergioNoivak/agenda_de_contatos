import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactHelper helper = ContactHelper();

  List<Contact> listaDeContatos = List();

  @override
  void initState() {
    helper.getAllContacts().then((list) {
      setState(() {
        listaDeContatos = list;
      });
    });

    super.initState();
  }

  // //Esse metodo é invocado quando a pagina for criada
  // @override
  // void initState() {
  //   super.initState();
  //   // Contact c = Contact();
  //   // c.name = "name";
  //   // c.email = "email";
  //   // c.img = "img";
  //   // c.phone = "phone";
  //   // helper.saveContact(c);
  //   helper.getAllContacts().then((list){
  //       print(list);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Contatos"),
          backgroundColor: Colors.red,
          centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: listaDeContatos.length,
          itemBuilder: (context, index) {}),
    );
  }

  Widget ContactCard(BuildContext context, int index) {
    return GestureDetector(
        child: Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: null))),
          ],
        ),
      ),
    ));
  }
}
