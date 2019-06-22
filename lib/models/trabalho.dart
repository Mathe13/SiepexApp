class Trabalho {
  int idTrabalho;
  String titulo;
  String modalidade;
  String autor;
  String demaisColaboradores;
  String tipoApresentacao;
  String dia;
  String hora;
  String predioSala;
  String areaEnsino;

  Trabalho(
      {this.idTrabalho,
      this.titulo,
      this.modalidade,
      this.autor,
      this.demaisColaboradores,
      this.tipoApresentacao,
      this.dia,
      this.hora,
      this.predioSala,
      this.areaEnsino});

  fromJson(Map<String, dynamic> json) {
    idTrabalho = json['id_trabalho'];
    titulo = json['titulo'];
    modalidade = json['modalidade'];
    autor = json['autor'];
    demaisColaboradores = json['demais_colaboradores'];
    tipoApresentacao = json['tipo_apresentacao'];
    dia = json['dia'];
    hora = json['hora'];
    predioSala = json['predio_sala'];
    areaEnsino = json['area_ensino'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_trabalho'] = this.idTrabalho;
    data['titulo'] = this.titulo;
    data['modalidade'] = this.modalidade;
    data['autor'] = this.autor;
    data['demais_colaboradores'] = this.demaisColaboradores;
    data['tipo_apresentacao'] = this.tipoApresentacao;
    data['dia'] = this.dia;
    data['hora'] = this.hora;
    data['predio_sala'] = this.predioSala;
    data['area_ensino'] = this.areaEnsino;
    return data;
  }
}
