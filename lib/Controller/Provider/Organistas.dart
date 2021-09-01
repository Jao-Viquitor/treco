

import 'dart:math';


import 'package:flutter/material.dart';
import 'package:treco/Model/Musicistas/Organista.dart';
import 'package:treco/Model/Musicistas/dummy_organista.dart';

class OrganistaProvider with ChangeNotifier {

  Map<String, Organista> _itens = {...DUMMY_ORGANISTA};

  List<Organista> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Organista byIndex(int i){
    return _itens.values.elementAt(i);
  }

  void put(Organista tocar){
    if(tocar == null)
      return;


    if(tocar.id != null && tocar.id.trim().isEmpty &&_itens.containsKey(tocar.id)){
      //Se existe, altera
      _itens.update(tocar.id, (value) => Organista(tocar.id,
        nome: tocar.nome,
        nivel: tocar.nivel,
        comum: tocar.comum,
        batismo: tocar.batismo,
        telefone: tocar.telefone,
          ));
    } else {
      //Se nulo, adiciona novo
      adicionaNovo(tocar.nome, tocar.nivel, tocar.comum, tocar.batismo, tocar.telefone);
    }
    notifyListeners();
  }

  void adicionaNovo(String nome, String nivel, List<String> comum, String batismo, String telefone){
    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(id, () => Organista(id,
      nome: nome,
      nivel: nivel,
      comum: comum,
      batismo: batismo,
      telefone: telefone,
    ));
    notifyListeners();
  }

  void remove(Organista tocar){
    if(tocar != null && tocar.id != null){
      _itens.remove(tocar.id);
      notifyListeners();
    }
  }

  bool containsIdNome(String str){
    for(int i = 0; i < _itens.length; i++){
      if(_itens.values.elementAt(i).id == str || _itens.values.elementAt(i).nome == str){
        return true;
      }
    }
    return false;
  }

  Organista containsOrg(String str) {
    for(int i = 0; i < _itens.length; i++){
      if(_itens.values.elementAt(i).id == str || _itens.values.elementAt(i).nome == str){
        return _itens.values.elementAt(i);
      }
     }
    return _itens.values.elementAt(0);
    }

  bool containsSenha(String str){
    for(int i = 0; i < _itens.length; i++){
      if(_itens.values.elementAt(i).id == str){
        return true;
      }
    }
    return false;
  }

}