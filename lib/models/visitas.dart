class Visita {
  int idVisitas;
  String km;
  String kmTotal;
  String deslocamento;
  String saida;
  String retorno;
  List<TblContatoVisitas> tblContatoVisitas;
  List<TblLocaisVisitas> tblLocaisVisitas;

  Visita(
      {this.idVisitas,
      this.km,
      this.kmTotal,
      this.deslocamento,
      this.saida,
      this.retorno,
      this.tblContatoVisitas,
      this.tblLocaisVisitas});

  String getListaLocais() {
    if (this.tblLocaisVisitas == null || this.tblLocaisVisitas.length == 0) {
      return '';
    } else {
      String retorno = '';
      this.tblLocaisVisitas.forEach((f) {
        retorno +=
            f.local + ((f.custo != '') ? " custo:" + f.custo : '') + "\n";
      });
      return retorno;
    }
  }

  Visita.fromJson(Map<String, dynamic> json) {
    idVisitas = json['id_visitas'];
    km = json['km'];
    kmTotal = json['km_total'];
    deslocamento = json['deslocamento'];
    saida = json['saida'];
    retorno = json['retorno'];
    if (json['tbl_contato_visitas'] != null) {
      tblContatoVisitas = new List<TblContatoVisitas>();
      json['tbl_contato_visitas'].forEach((v) {
        tblContatoVisitas.add(new TblContatoVisitas.fromJson(v));
      });
    }
    if (json['tbl_locais_visitas'] != null) {
      tblLocaisVisitas = new List<TblLocaisVisitas>();
      json['tbl_locais_visitas'].forEach((v) {
        tblLocaisVisitas.add(new TblLocaisVisitas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_visitas'] = this.idVisitas;
    data['km'] = this.km;
    data['km_total'] = this.kmTotal;
    data['deslocamento'] = this.deslocamento;
    data['saida'] = this.saida;
    data['retorno'] = this.retorno;
    if (this.tblContatoVisitas != null) {
      data['tbl_contato_visitas'] =
          this.tblContatoVisitas.map((v) => v.toJson()).toList();
    }
    if (this.tblLocaisVisitas != null) {
      data['tbl_locais_visitas'] =
          this.tblLocaisVisitas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TblContatoVisitas {
  int id;
  int idVisitas;
  String nome;
  String telefone1;
  String telefone2;
  String email;

  TblContatoVisitas(
      {this.id,
      this.idVisitas,
      this.nome,
      this.telefone1,
      this.telefone2,
      this.email});

  TblContatoVisitas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idVisitas = json['id_visitas'];
    nome = json['nome'];
    telefone1 = json['telefone_1'];
    telefone2 = json['telefone_2'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_visitas'] = this.idVisitas;
    data['nome'] = this.nome;
    data['telefone_1'] = this.telefone1;
    data['telefone_2'] = this.telefone2;
    data['email'] = this.email;
    return data;
  }
}

class TblLocaisVisitas {
  int id;
  int idVisitas;
  String local;
  String inicio;
  String tempoVisita;
  String custo;
  TblLocaisVisitas(
      {this.id,
      this.idVisitas,
      this.local,
      this.inicio,
      this.tempoVisita,
      this.custo});

  TblLocaisVisitas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idVisitas = json['id_visitas'];
    local = json['local'];
    inicio = json['inicio'];
    tempoVisita = json['tempo_visita'];
    custo = json['custo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_visitas'] = this.idVisitas;
    data['local'] = this.local;
    data['inicio'] = this.inicio;
    data['tempo_visita'] = this.tempoVisita;
    data['custo'] = this.custo;
    return data;
  }
}
