import 'dart:io';

import 'package:agenda_de_contatos/helpers/contact_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactPage extends StatefulWidget {
  //contato que será passado para construir o contato
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
   final nameFocus =FocusNode();

  final controladorName = TextEditingController();
  final controladorEmail = TextEditingController();
  final controladorPhone = TextEditingController();

  Contact _editedContact;
  @override
  void initState() {
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      controladorName.text = _editedContact.name;
      controladorEmail.text = _editedContact.email;
      controladorPhone.text = _editedContact.phone;
    }
  }

  bool _userEdited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
        onPressed: () {
          if (_editedContact.name.isNotEmpty && _editedContact!=null) {
              Navigator.pop(context,_editedContact);
          }
          else{
            FocusScope.of(context).requestFocus(this.nameFocus);
          }
        },
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: _editedContact.img != null
                              ? AssetImage("img/Mallard2.jpg")
                              : AssetImage("img/Mallard2.jpg")),
                    )),
              ),
              TextField(
                controller: this.controladorName,
                focusNode: this.nameFocus,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (text) {
                  this._userEdited = true;
                  setState(() {
                    this._editedContact.name = text;
                  });
                },
              ),
              TextField(
                controller: this.controladorEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (text) {
                  this._userEdited = true;
                  this._editedContact.email = text;
                },
              ),
              TextField(
                controller: this.controladorPhone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Phone"),
                onChanged: (text) {
                  this._userEdited = true;
                  this._editedContact.email = text;
                },
              ),
            ],
          )),
    );
  }
}
