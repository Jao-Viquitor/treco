import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/Controller/Provider/Organistas.dart';
import 'package:treco/Controller/Provider/Rodizios.dart';
import 'package:treco/Controller/routes/Rotas.dart';
import 'package:treco/Model/Musicistas/Organista.dart';
import 'package:treco/View/Componentes/OrganistasTile.dart';
import 'package:treco/View/Componentes/RodiziosTile.dart';

class HomeOrganista extends StatefulWidget {
  HomeOrganista(this.args);
  final Organista args;

  @override
  _HomeOrganista createState() => _HomeOrganista(args);
}

class _HomeOrganista extends State<HomeOrganista> {
  int _indiceAtual = 0;

  _HomeOrganista(this.args);
  final Organista args;

  @override
  Widget build(BuildContext context) {
    final RodiziosProvider rodizios = Provider.of(context);
    final OrganistaProvider organistas = Provider.of(context);
    final List<Widget> _telas = [
      paginaRodizio(rodizios),
      paginaOrganista(organistas),
      paginaPerfil(args),
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
            label: "Rodízios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_week),
            label: "Organistas",
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
    return Scaffold(
      body: ListView.builder(
        itemCount: rodizios.count,
        itemBuilder: (context, i) => RodiziosTile(rodizios.byIndex(i)),
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Novo Rodízio"),
            ),
          ),
        ],
      ),
    );
  }

  paginaOrganista(OrganistaProvider organistas) {
    return Scaffold(
      body: ListView.builder(
        itemCount: organistas.count,
        itemBuilder: (context, i) => OrganistasTile(organistas.byIndex(i)),
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    Rotas.ORGANISTA_FORM
                );
              },
              icon: Icon(Icons.add),
              label: Text("Nova organista"),
            ),
          ),
        ],
      ),
    );
  }

  paginaPerfil(Organista organista) {
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
                  Text(
                    "${organista.nome}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 72,
                        fontFamily: 'Raleway'),
                  ),
                ],
              ),
              Stack(
                children: [
                  Text(
                    "${organista.telefone}",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${organista.nivel}",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      "${organista.batismo}",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      "${organista.comum}",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              ButtonBar(),
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
