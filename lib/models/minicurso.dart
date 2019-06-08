class Minicurso {
  int id;
  String titulo;
  String palestrante;
  String inicio;
  String fim;
  int vagas;
  String predio;
  String sala;
  String obs;

  Minicurso(
      {this.id,
      this.titulo,
      this.palestrante,
      this.inicio,
      this.fim,
      this.vagas,
      this.predio,
      this.sala,
      this.obs});

  fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.titulo = json['titulo'];
    this.palestrante = json['palestrante'];
    this.inicio = json['inicio'];
    this.fim = json['fim'];
    this.vagas = json['vagas'];
    this.predio = json['predio'];
    this.sala = json['sala'];
    this.obs = json['obs'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['palestrante'] = this.palestrante;
    data['inicio'] = this.inicio;
    data['fim'] = this.fim;
    data['vagas'] = this.vagas;
    data['predio'] = this.predio;
    data['sala'] = this.sala;
    data['obs'] = this.obs;
    return data;
  }
}
