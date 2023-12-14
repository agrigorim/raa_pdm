class Usuario {
  String _nome;
  String _email;
  String _senha;

  Usuario({required String nome, required String email, required String senha})
      : this._nome = nome,
        this._email = email,
        this._senha = senha;

  String get nome => this._nome;
  String get email => this._email;
  String get senha => this._senha;
  void set nome(String nome) => this._nome = nome;
  void set email(String email) => this._email = email;
  void set senha(String senha) => this._senha = senha;
}
