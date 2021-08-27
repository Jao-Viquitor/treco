import 'package:flutter/material.dart';
import 'package:treco/Controller/Provider/Rodizios.dart';
import 'Controller/routes/Rotas.dart';
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
      ],
      child: MaterialApp(
        title: 'CEBOLA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeRodizio(),
        routes: {
          Rotas.HOME_RODIZIO: (_) => HomeRodizio(),
        },
      ),
    );
  }
}
