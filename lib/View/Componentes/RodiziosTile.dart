import 'package:flutter/material.dart';
import 'package:treco/Model/Rodizio/Rodizio.dart';

class RodiziosTile extends StatelessWidget {
  final Rodizio tocar;

  const RodiziosTile(this.tocar);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          title: Text(tocar.nome),
          subtitle: Text(tocar.local + "\n" + tocar.data),
          isThreeLine: true,
    ));
  }
}
