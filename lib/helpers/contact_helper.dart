import 'package:sqflite/sqflite.dart';


final String idColumn ="idColumn"; 
final String nameColumn ="nameColumn"; 
final String emailColumn ="emailColumn"; 
final String imgColumn ="imgColumn"; 
final String phoneColumn ="phoneColumn"; 


class ContactHelper {


}

class Contact {
  int id;
  String name;
  String email;
  String img;
  String phone;

  Contact.fromMap(Map map){
      this.id = map[idColumn];
      this.name = map[nameColumn];
      this.email = map[emailColumn];
      this.img = map[imgColumn];
      this.phone = map[phoneColumn];
    
  }

  Map<String,dynamic> toMap(){
      Map<String,dynamic> map ={
            nameColumn:name,
            emailColumn:email,
            imgColumn:img,
            phoneColumn:phone
      };

    if(id!=null)
      map[idColumn]=id;

    return map;

  }


    @override
  String toString() {
    return """
      Contact(
          id: $id,  
          name: $name,  
          email: $email,  
          img: $img,  
          phone: $phone
      )
    """;
  }

}
