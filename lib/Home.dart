import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/View/ViewExaminadora/HomeOrganista.dart';
import 'package:treco/View/ViewOganista/HomeRodizio.dart';

import 'Controller/Provider/Organistas.dart';
import 'Model/Musicistas/Examinadora.dart';
import 'Model/Musicistas/Organista.dart';
import 'View/Formulario.dart';

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {

  StreamController _dataStream = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage("https://wallpapercave.com/wp/wp5129072.jpg"),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
        child: Center(
          child: Form(
            child: StreamBuilder(
              stream: _dataStream.stream,
              initialData: "Login",
              builder: (context, snapshot){
                if(snapshot.data == "Login"){
                    return Formulario(_dataStream);
                } else if (snapshot.data != "Login"){
                  return AlertDialog(
                        elevation: 12.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title: Text("Deu erro", textAlign: TextAlign.center, ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text("Alguma coisa deu errada")
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Fechar"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurpleAccent,
                                  shadowColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                              )
                          )
                        ],
                      );
                }
                return CircularProgressIndicator();
              }
            ),
          ),
        ),
      ),
    );
  }

  }

