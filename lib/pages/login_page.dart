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
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  bool loading = false;
  bool logged = false;

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
    if (loading) {
      setState(() => logged = true);
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
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
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState != null &&
                    formKey.currentState!.validate()) {
                  login();
                }
                if (logged) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuário ou senha incorreto!')));
                }
              },
              child: Text('Entrar'),
            ),
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
        ),
      ),
    );
  }
}
