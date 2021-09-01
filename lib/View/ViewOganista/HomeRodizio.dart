import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/Controller/Provider/Organistas.dart';
import 'package:treco/Controller/Provider/Rodizios.dart';
import 'package:treco/Model/Musicistas/Organista.dart';

import '../Componentes/OrganistasTile.dart';
import '../Componentes/RodiziosTile.dart';

class HomeRodizio extends StatefulWidget {

  HomeRodizio(this.args);
  final Organista args;

  @override
  _HomeRodizio createState() => _HomeRodizio(args);

}

class _HomeRodizio extends State<HomeRodizio>{

  int _indiceAtual = 0;

  _HomeRodizio(this.args);
  final Organista args;

  @override
  Widget build(BuildContext context) {
    final RodiziosProvider rodizios = Provider.of(context);
    final OrganistaProvider organistas =  Provider.of(context);
    final List<Widget> _telas = [
      paginaRodizio(rodizios),
      paginaPerfil(organistas),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("${args.nome}, Lista De Rodízios"),
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

  paginaPerfil(OrganistaProvider organistas) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Text("${args.nome}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 72, fontFamily: 'Raleway'),),
                ],
              ),
              Stack(
                children: [
                  Text("${args.telefone}", style: TextStyle(color: Colors.black, fontSize: 24), ),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${args.nivel}", style: TextStyle(color: Colors.black54),),
                    Text("${args.batismo}", style: TextStyle(color: Colors.black54),),
                    Text("${args.comum}", style: TextStyle(color: Colors.black54),),
                  ],
                ),),
              ButtonBar(

              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index){
    setState((){
      _indiceAtual = index;
    });
  }

}


