import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raa_pdm/pages/home_page.dart';
import 'package:raa_pdm/pages/cadastro_page.dart';
import 'package:raa_pdm/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  String errorMessage = '';
  bool loading = false;

  login() async {
    setState(() => loading = true);
    try {
      await context
          .read<AuthService>()
          .login(emailController.text, senhaController.text);
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
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        titleTextStyle: TextStyle(color: Colors.white),
        title: Text('Seja Bem-Vindo!'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  child: Text('Entrar'),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  child: Text('Cadastre-se'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastroPage(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
