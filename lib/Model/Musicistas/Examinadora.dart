import 'Organista.dart';

class Examinadora extends Organista{

  final String senha;

  const Examinadora(String id, {required String nome, required List<String> comum, required String nivel, required String batismo, required String telefone, required this.senha})
      : super(id, nome: nome, comum: comum, nivel: nivel, batismo: batismo, telefone: telefone);


}