import 'package:flutter/material.dart';
import 'package:raa_pdm/pages/adicionar_solicitacao_page.dart';
import 'package:raa_pdm/models/solicitacao.dart';
import 'package:raa_pdm/pages/solicitacao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  mostrarDetalhes(Solicitacao solicitacao) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SolicitacaoPage(solicitacao: solicitacao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        titleTextStyle: TextStyle(color: Colors.white),
        title: Text('Solicitações Públicas'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdicionarSolicitacaoPage(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
