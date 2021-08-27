import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/Controller/Provider/Rodizios.dart';
import 'package:treco/View/Componentes/RodiziosTile.dart';

class HomeRodizio extends StatefulWidget {

  @override
  _HomeRodizio createState() => _HomeRodizio();

}

class _HomeRodizio extends State<HomeRodizio>{

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    final RodiziosProvider rodizios = Provider.of(context);
    final List<Widget> _telas = [
      paginaRodizio(rodizios),
      paginaPerfil(),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("Lista De Rodízios"),
          centerTitle: true,
        ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "Rodízio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
      );
  }

  paginaRodizio(RodiziosProvider rodizios) {
    return ListView.builder(
      itemCount: rodizios.count,
      itemBuilder: (context, i) => RodiziosTile(rodizios.byIndex(i)),
    );
  }

  paginaPerfil() {
    return Text("Seu nome vai aqui");
  }

  void onTabTapped(int index){
    setState((){
      _indiceAtual = index;
    });
  }

}


