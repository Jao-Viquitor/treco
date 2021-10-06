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
          child: NFormulario(),
      ),
    ),
    );
  }

  }

