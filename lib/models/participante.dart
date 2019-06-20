import 'package:shared_preferences/shared_preferences.dart';

class Participante {
  String id;
  String datahoraCadastro;
  String migradoEm;
  String atualizadoEm;
  String email;
  String nome;
  String rg;
  String cpf;
  String possuiNecessidadeEspecial;
  String categoria;
  String unidadeEnsino;
  String utilizaTransporteUergs;
  String unidadeOrigem;
  String concordaTermo;
  String possuiNecessidadeEspecialTransporte;
  String descNecessidadeEspecialTranporte;
  String utilizaAlimentaOUergs;
  String possuiNecessidadeEspecialAlimentacao;
  String descNecessidadeEspecialAlimentacao;
  String utilizaAlojamentoUergs;
  String apresentaraTrabalho;
  String instituiOEnsino;
  String idTrab1;
  String idTrab2;
  String senha;

  Participante(
      {this.id,
      this.datahoraCadastro,
      this.migradoEm,
      this.atualizadoEm,
      this.email,
      this.nome,
      this.rg,
      this.cpf,
      this.possuiNecessidadeEspecial,
      this.categoria,
      this.unidadeEnsino,
      this.utilizaTransporteUergs,
      this.unidadeOrigem,
      this.concordaTermo,
      this.possuiNecessidadeEspecialTransporte,
      this.descNecessidadeEspecialTranporte,
      this.utilizaAlimentaOUergs,
      this.possuiNecessidadeEspecialAlimentacao,
      this.descNecessidadeEspecialAlimentacao,
      this.utilizaAlojamentoUergs,
      this.apresentaraTrabalho,
      this.instituiOEnsino,
      this.idTrab1,
      this.idTrab2,
      this.senha});

  fromJson(Map<String, dynamic> json) {
    this.id = json['id'].toString();
    this.datahoraCadastro = json['datahora_cadastro'];
    this.migradoEm = json['migrado_em'];
    this.atualizadoEm = json['atualizado_em'];
    this.email = json['email'];
    this.nome = json['nome'];
    this.rg = json['rg'];
    this.cpf = json['cpf'];
    this.possuiNecessidadeEspecial = json['possui_necessidade_especial'];
    this.categoria = json['categoria'];
    this.unidadeEnsino = json['unidade_ensino'];
    this.utilizaTransporteUergs = json['utiliza_transporte_uergs'];
    this.unidadeOrigem = json['unidade_origem'];
    this.concordaTermo = json['concorda_termo'];
    this.possuiNecessidadeEspecialTransporte =
        json['possui_necessidade_especial_transporte'];
    this.descNecessidadeEspecialTranporte =
        json['desc_necessidade_especial_tranporte'];
    this.utilizaAlimentaOUergs = json['utiliza_alimentação_uergs'];
    this.possuiNecessidadeEspecialAlimentacao =
        json['possui_necessidade_especial_alimentacao'];
    this.descNecessidadeEspecialAlimentacao =
        json['desc_necessidade_especial_alimentacao'];
    this.utilizaAlojamentoUergs = json['utiliza_alojamento_uergs'];
    this.apresentaraTrabalho = json['apresentara_trabalho'];
    this.instituiOEnsino = json['instituição_ensino'];
    this.idTrab1 = json['id_trab1'];
    this.idTrab2 = json['id_trab2'];
    this.senha = json['senha'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['datahora_cadastro'] = this.datahoraCadastro;
    data['migrado_em'] = this.migradoEm;
    data['atualizado_em'] = this.atualizadoEm;
    data['email'] = this.email;
    data['nome'] = this.nome;
    data['rg'] = this.rg;
    data['cpf'] = this.cpf;
    data['possui_necessidade_especial'] = this.possuiNecessidadeEspecial;
    data['categoria'] = this.categoria;
    data['unidade_ensino'] = this.unidadeEnsino;
    data['utiliza_transporte_uergs'] = this.utilizaTransporteUergs;
    data['unidade_origem'] = this.unidadeOrigem;
    data['concorda_termo'] = this.concordaTermo;
    data['possui_necessidade_especial_transporte'] =
        this.possuiNecessidadeEspecialTransporte;
    data['desc_necessidade_especial_tranporte'] =
        this.descNecessidadeEspecialTranporte;
    data['utiliza_alimentação_uergs'] = this.utilizaAlimentaOUergs;
    data['possui_necessidade_especial_alimentacao'] =
        this.possuiNecessidadeEspecialAlimentacao;
    data['desc_necessidade_especial_alimentacao'] =
        this.descNecessidadeEspecialAlimentacao;
    data['utiliza_alojamento_uergs'] = this.utilizaAlojamentoUergs;
    data['apresentara_trabalho'] = this.apresentaraTrabalho;
    data['instituição_ensino'] = this.instituiOEnsino;
    data['id_trab1'] = this.idTrab1;
    data['id_trab2'] = this.idTrab2;
    data['senha'] = this.senha;
    return data;
  }

  /// Recebe um Objeto do Usuario e grava key e value localmente
  Future setStorage() async {
    Map<String, dynamic> map = this.toJson();
    List<String> value = [], key = [];
    map.forEach((k, v) {
      print(k);
      key.add(k);
      value.add(v);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('userKey', key);
    await prefs.setStringList('userValue', value);
    print('usuario salvo com sucesso');
  }

  static Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userKey');
    prefs.remove('userValue');
  }

  /// Não recebe nenhum parâmentro e retorna um Objeto do Usuario gravado localmente
  static Future getStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> key = prefs.getStringList('userKey');
    List<String> value = prefs.getStringList('userValue');
    Map map = {};
    if (key == null) {
      return false;
    } else {
      for (int i = 0; i < key.length; i++) {
        map.addAll({key[i]: value[i]});
      }
      var retorno = new Participante();
      print("tipo do mapa:" + (map.runtimeType).toString());
      print(new Map<String, dynamic>.from(map));
      return retorno.fromJson(new Map<String, dynamic>.from(map));
    }
  }
}
