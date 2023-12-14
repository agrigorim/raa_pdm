class Comentario {
  final String _texto;
  final String _nomeUsuario;
  final DateTime _data;

  Comentario(
      {required String texto,
      required String nomeUsuario,
      required DateTime data})
      : this._texto = texto,
        this._nomeUsuario = nomeUsuario,
        this._data = data;

  String get texto => this._texto;
  String get nomeUsuario => this._nomeUsuario;
  DateTime get data => this._data;
}
