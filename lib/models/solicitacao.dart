import 'package:firebase_auth/firebase_auth.dart';

class Solicitacao {
  final String _titulo;
  final String _descricao;
  final User _usuario;
  final DateTime _data;
  //geolocalizacao
  //foto

  Solicitacao(
      {required String titulo,
      required String descricao,
      required User usuario,
      required DateTime data})
      : this._titulo = titulo,
        this._descricao = descricao,
        this._usuario = usuario,
        this._data = data;

  String get titulo => this._titulo;
  String get descricao => this._descricao;
  User get usuario => this._usuario;
  DateTime get data => this._data;
}
