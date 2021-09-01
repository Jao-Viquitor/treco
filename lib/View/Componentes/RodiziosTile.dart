import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treco/Model/Rodizio/Rodizio.dart';

class RodiziosTile extends StatelessWidget {
  final Rodizio tocar;

  const RodiziosTile(this.tocar);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(tocar.nome),
        subtitle: Text(tocar.local + "\n" + tocar.data),
        isThreeLine: true,
        onTap: () => {
          AlertDialog(
            content: _showMyDialog(tocar, context),
          ),
        },
      ),
    );
  }

  _showMyDialog(Rodizio rodizio, BuildContext context) {
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
                Text(tocar.data),
                Text(tocar.local),
                Text(tocar.organista.toString()),
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
