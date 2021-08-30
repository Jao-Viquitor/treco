import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treco/Model/Rodizio/Rodizio.dart';
import 'package:treco/Model/Rodizio/dummy_rodizio.dart';

class RodiziosProvider with ChangeNotifier {
  Map<String, Rodizio> _itens = {...DUMMY_RODIZIO};

  List<Rodizio> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Rodizio byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  bool contaisKey(String str){
    return _itens.containsKey(str);
  }

  void put(Rodizio tocar) {
    if (tocar == null) return;

    if (tocar.id != null &&
        tocar.id.trim().isEmpty &&
        _itens.containsKey(tocar.id)) {
      //Se existe, altera
      _itens.update(
          tocar.id,
          (value) => Rodizio(tocar.id,
              categoria: tocar.categoria,
              nome: tocar.nome,
              local: tocar.local,
              data: tocar.data,));
    } else {
      //Se nulo, adiciona novo
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(
          id,
          () => Rodizio(id,
              categoria: tocar.categoria,
              nome: tocar.nome,
              local: tocar.local,
              data: tocar.data,));
    }
    notifyListeners();
  }

  void remove(Rodizio tocar) {
    if (tocar != null && tocar.id != null) {
      _itens.remove(tocar.id);
      notifyListeners();
    }
  }
}
