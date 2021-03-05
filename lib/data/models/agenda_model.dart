
class AgendaModel {
  String id;
  String nome;
  String descricao;
  String senha;
  String foto;
  List participantes;

  AgendaModel({this.id, this.nome, this.descricao, this.senha, this.foto, this.participantes});

  AgendaModel.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.descricao = map['descricao'];
    this.senha = map['senha'];
    this.foto = map['foto'];
    this.participantes = map['participantes'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'nome': this.nome,
      'descricao': this.descricao,
      'senha': this.senha,
      'foto': this.foto,
      'participantes': this.participantes
    };
    return map;
  }
}