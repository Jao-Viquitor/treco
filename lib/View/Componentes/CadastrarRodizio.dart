import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/Controller/Provider/Organistas.dart';
import 'package:treco/Controller/Provider/Rodizios.dart';
import 'package:treco/Model/Musicistas/Organista.dart';
import 'package:treco/Model/Rodizio/Rodizio.dart';

class CadastrarRodizio extends StatefulWidget {

  @override
  _CadastrarRodizioState createState() => _CadastrarRodizioState();
}

class _CadastrarRodizioState extends State<CadastrarRodizio> {

  late final String categoria;
  late final String nome;
  late final String local;
  late final String data;
  late final String organista1;
  late final String organista2;
  late List<String> organista;

  TextEditingController cat = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController here = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController org1 = TextEditingController();
  TextEditingController org2 = TextEditingController();

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formRodizio = {};


  @override
  Widget build(BuildContext context) {
    List<String> str = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar nova organista"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: _form,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        //Categoria
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: cat,
                            onChanged: (cod) {
                              categoria = cat.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Categoria",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                            ),
                            validator: (name) {
                              if (categoria == null || categoria.isEmpty) {
                                return "Nome inválido";
                              }
                              return null;
                            },
                            onSaved: (cat) => categoria = cat!.toString(),
                          ),
                        ),
                        //Nome
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: name,
                            onChanged: (cod) {
                              nome = name.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Nome",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                            ),
                            validator: (nome) {
                              if (nome == null || nome.isEmpty) {
                                return "Nome inválido";
                              }
                              return null;
                            },
                            onSaved: (name) => _formRodizio['nome'] = name.toString(),
                          ),
                        ),
                        //Local
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: here,
                            onChanged: (cod) {
                              local = here.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Local",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                            ),
                            validator: (local) {
                              if (local == null || local.isEmpty) {
                                return "Nome inválido";
                              }
                              return null;
                            },
                            onSaved: (here) => _formRodizio['data'] = here.toString(),
                          ),
                        ),
                        //Data
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: date,
                            onChanged: (date) {
                              data = date.toString();
                            },
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              labelText: "Data",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                            ),
                            validator: (data) {
                              if (data == null || data.isEmpty) {
                                return "Nome inválido";
                              }
                              return null;
                            },
                            onSaved: (date) => _formRodizio['data'] = date.toString(),
                          ),
                        ),
                        //organista
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: org1,
                            onChanged: (org1) {
                              organista1 = org1.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                            ),
                            validator: (organista1) {
                              if (organista1 == null || organista1.isEmpty) {
                                return "Nome inválido";
                              }
                              return null;
                            },
                            onSaved: (org1) {
                              organista1 = org1.toString();
                              str[0] = organista1;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            controller: org2,
                            onChanged: (org2) {
                              organista2 = org2.toString();
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple)),
                            ),
                            validator: (organista2) {
                              if (organista2 == null || organista2.isEmpty) {
                                return "Nome inválido";
                              }
                              return null;
                            },
                              onSaved: (org2) {
                                organista2 = org2.toString();
                                str[1] = organista2;
                                _formRodizio['organista'] = str as String;
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //_form.currentState!.save();
                      Provider.of<RodiziosProvider>(context).adicionarNovo(categoria, nome, local, data, organista);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Confirmar"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        shadowColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        shadowColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))))
              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  void initState() {
    super.initState();
  }

}
