class Geral {
  int id;
  String dia;
  String programacao;
  String inicio;
  String fim;
  String localizacao;

  Geral(
      {this.id,
      this.dia,
      this.programacao,
      this.inicio,
      this.fim,
      this.localizacao});

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dia = json['dia'];
    programacao = json['programacao'];
    inicio = json['inicio'];
    fim = json['fim'];
    localizacao = json['localizacao'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dia'] = this.dia;
    data['programacao'] = this.programacao;
    data['inicio'] = this.inicio;
    data['fim'] = this.fim;
    data['localizacao'] = this.localizacao;
    return data;
  }
}
