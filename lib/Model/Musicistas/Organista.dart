class Organista{

  final String id;
  final String nome;
  final List<String> comum;
  final String nivel;
  final String batismo;
  final String telefone;

  const Organista(this.id, {
    required this.nome,
    required this.comum,
    required this.nivel,
    required this.batismo,
    required this.telefone
  });

  @override
  String toString() {

    String str = "";
    for(int i = 0; i < comum.length; i++){
      str += str + "; \n";
    }
    return str;

  }
}