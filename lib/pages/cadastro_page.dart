import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raa_pdm/pages/login_page.dart';
import 'package:raa_pdm/services/auth_service.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool loading = false;

  registrar() async {
    setState(() => loading = true);
    try {
      await context
          .read<AuthService>()
          .registrar(emailController.text, senhaController.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        titleTextStyle: TextStyle(color: Colors.white),
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Nome obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Email obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Senha obrigatória';
                  }
                  return null;
                },
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registrar();
                  }
                  setState(() => loading = false);
                },
                child: Text('Cadastrar'),
              ),
              loading ? CircularProgressIndicator() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
