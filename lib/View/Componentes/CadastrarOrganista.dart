import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treco/Controller/Provider/Organistas.dart';
import 'package:treco/Model/Musicistas/Organista.dart';

class CadastrarOrganista extends StatefulWidget {
  const CadastrarOrganista({Key? key}) : super(key: key);

  @override
  _CadastrarOrganistaState createState() => _CadastrarOrganistaState();
}

class _CadastrarOrganistaState extends State<CadastrarOrganista> {
  late String comum1;
  late String comum2;
  late String nivel;
  late String batismo;
  List itens = [
    "Todos",
    "Olimpo",
    "Valhala",
    "Jade",
    "Takam-No-Hara",
  ];
  List apta = ["Iniciante", "Médio", "Oficializado"];
  List dois = ["Sim", "Não"];
  late final String nome;
  late final String telefone;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar novo Músico"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
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
                      labelText: "Nome do Músico",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                    ),
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return "Nome inválido";
                      }
                      return null;
                    },
                    onSaved: (name) => nome = name!.toString(),
                  ),
                ),
                //telefone
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: phone,
                    onChanged: (phone) {
                      telefone = phone.toString();
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "número de Telefone",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                    ),
                    validator: (phone) {
                      if (phone == null || phone.isEmpty && phone.length < 11) {
                        return "Telefone inválido";
                      }
                      return null;
                    },
                    onSaved: (phone) => telefone = phone!.toString(),
                  ),
                ),
                //Comum
                Text(
                  "Comum",
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
                Container(
                  child: DropdownButton(
                    hint: Text("Escolha uma opção: "),
                    elevation: 12,
                    isExpanded: true,
                    style: TextStyle(color: Colors.deepPurpleAccent),
                    value: comum1,
                    onChanged: (newValue) {
                      setState(() {
                        comum1 = newValue.toString();
                      });
                    },
                    items: itens.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  child: DropdownButton(
                    hint: Text("Escolha uma opção"),
                    isExpanded: true,
                    style: TextStyle(color: Colors.deepPurpleAccent),
                    value: comum2,
                    onChanged: (newValue) {
                      setState(() {
                        comum2 = newValue.toString();
                      });
                    },
                    items: itens.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                //Nível
                Text(
                  "Nível",
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: DropdownButton(
                      hint: Text("Escolha uma opção"),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurpleAccent),
                      value: nivel,
                      onChanged: (newValue) {
                        setState(() {
                          nivel = newValue.toString();
                        });
                      },
                      items: apta.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                //batismo
                Text(
                  "Apta",
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: DropdownButton(
                      hint: Text("Escolha uma opção"),
                      isExpanded: true,
                      style: TextStyle(color: Colors.deepPurpleAccent),
                      value: batismo,
                      onChanged: (newValue) {
                        setState(() {
                          batismo = newValue.toString();
                        });
                      },
                      items: dois.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<OrganistaProvider>(context).adicionaNovo(
                          nome.toString(),
                          nivel.toString(),
                          [comum1.toString(), comum2.toString()],
                          batismo.toString(),
                          telefone.toString());
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
    comum1 = itens[0];
    comum2 = itens[0];
    nivel = apta[0];
    batismo = dois[1];
  }
}
