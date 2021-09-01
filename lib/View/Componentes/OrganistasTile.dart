import 'package:flutter/material.dart';
import 'package:treco/Controller/routes/Rotas.dart';
import 'package:treco/Model/Musicistas/Organista.dart';

class OrganistasTile extends StatelessWidget {

  final Organista tocar;
  const OrganistasTile(this.tocar);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          title: new Center(child: Text(tocar.nome)),
          subtitle: Text(tocar.nivel + "\n" + tocar.comum.toString()),
          isThreeLine: true,
          onTap: () => {
          _showMyDialog(tocar, context)
          },
        ),
    );
  }

  _showMyDialog(Organista tocar, BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 12.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(tocar.nome, textAlign: TextAlign.center, ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(tocar.telefone),
                Text(tocar.comum.toString()),
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
      },
    );
  }
}
