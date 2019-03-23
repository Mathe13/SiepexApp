class Palestrante {
  String nome;
  String descricao;
  String formacao;
  String cargo;

  Palestrante({this.nome, this.descricao, this.formacao, this.cargo});

  Palestrante.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    formacao = json['formacao'];
    cargo = json['cargo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['formacao'] = this.formacao;
    data['cargo'] = this.cargo;
    return data;
  }
}
