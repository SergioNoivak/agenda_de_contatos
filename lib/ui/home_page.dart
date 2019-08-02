import 'dart:io';

import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:agenda_de_contatos/ui/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactHelper helper = ContactHelper();

  List<Contact> listaDeContatos = List();

  void getAllContacts(){
        helper.getAllContacts().then((list) {
      setState(() {
        listaDeContatos = list;
      });
    });
  }


  @override
  void initState() {
    getAllContacts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Contatos"),
          backgroundColor: Colors.red,
          centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _showContactPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: listaDeContatos.length,
          itemBuilder: _ContactCard
          ),
    );
  }

  Widget _ContactCard(BuildContext context, int index) {
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
                  image: DecorationImage(
                      image: listaDeContatos[index].img != null
                          ? AssetImage("img/Mallard2.jpg"): AssetImage("img/Mallard2.jpg")),
                )),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[
                  
                  Text(
                    listaDeContatos[index].name ?? "",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    listaDeContatos[index].email ?? "",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    listaDeContatos[index].phone ?? "",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    

      onTap:(){

          _showContactPage(contact: listaDeContatos[index]);
      }
    );
  }
  void _showContactPage({Contact contact}) async{

final recContact =await Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactPage(contact: contact,)));

if(recContact!=null){

  if(contact!=null){
      await helper.updateContact(recContact);

      
  }
  else{
    await helper.saveContact(recContact);
  }
        getAllContacts();
}


}
}



