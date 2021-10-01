import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/Controller/Provider/Organistas.dart';
import 'package:treco/Model/Musicistas/Examinadora.dart';
import 'package:treco/Model/Musicistas/Organista.dart';

import 'ViewExaminadora/HomeOrganista.dart';
import 'ViewOganista/HomeRodizio.dart';


class Formulario extends StatelessWidget {
  Formulario(this.data);
  StreamController data;
  late String codigo;
  late String senha;
  TextEditingController cod = TextEditingController();
  late bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final OrganistaProvider organistas =  Provider.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://wallpapercave.com/wp/wp5129072.jpg"),
            fit: BoxFit.cover,
          ),
        ), padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: cod,
                  onChanged: (cod){
                    codigo = cod.toString();
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Seu código",
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                    labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                  ),
                ), SizedBox(height: 20,),
                TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    labelText: "Sua senha",
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                    labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    suffixIcon: IconButton(
                      onPressed: (){
                      },
                      icon: isVisible ? Icon(Icons.visibility, color: Colors.deepPurple) :
                      Icon(Icons.visibility_off, color: Colors.deepPurpleAccent),
                    ),
                  ),
                ), SizedBox(height: 35,),
                ElevatedButton(
                    onPressed: () async {
                      data.add("Logando");
                      if(organistas.containsIdNome(codigo)){
                        Organista arg = organistas.containsOrg(codigo);
                        if(arg is Examinadora){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeOrganista(arg)));
                        } else if (arg is Organista){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeRodizio(arg)));
                        }
                      }
                    },
                    child: const Text("Entrar"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        shadowColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))))],
            ),
          ),
        ),),);
  }
}