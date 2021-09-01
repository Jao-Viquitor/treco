import 'package:flutter/material.dart';
import 'package:treco/Controller/Provider/Organistas.dart';
import 'package:treco/Controller/Provider/Rodizios.dart';
import 'package:treco/Model/Musicistas/Organista.dart';
import 'package:treco/View/Componentes/CadastrarOrganista.dart';
import 'Controller/routes/Rotas.dart';
import 'Home.dart';
import 'View/ViewOganista/HomeRodizio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RodiziosProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrganistaProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        routes: {
          Rotas.ORGANISTA_FORM: (_) => CadastrarOrganista(),
        },
      ),
    );
  }
}
