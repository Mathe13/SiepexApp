class Evento {
  String dia;
  String hora;
  String duracao;
  String titulo;
  String descricao;
  String autor;
  String sala;

  Evento(
      {this.dia,
      this.hora,
      this.duracao,
      this.titulo,
      this.descricao,
      this.autor,
      this.sala});

  Evento.fromJson(Map<String, dynamic> json) {
    dia = json['dia'];
    hora = json['hora'];
    duracao = json['duracao'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    autor = json['autor'];
    sala = json['sala'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dia'] = this.dia;
    data['hora'] = this.hora;
    data['duracao'] = this.duracao;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['autor'] = this.autor;
    data['sala'] = this.sala;
    return data;
  }
}
