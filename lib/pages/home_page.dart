import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raa_pdm/pages/adicionar_solicitacao_page.dart';
import 'package:raa_pdm/models/solicitacao.dart';
import 'package:raa_pdm/pages/solicitacao_page.dart';
import 'package:raa_pdm/services/firestore_service.dart';

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
            color: Colors.white,
          ),
        ],
      ),
      body: StreamBuilder<List<Solicitacao>>(
        stream: FireStoreService().getSolicitacoes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Algo deu errado!'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhuma solicitação encontrada!'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    mostrarDetalhes(snapshot.data![index]);
                  },
                  title: Text(snapshot.data![index].titulo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
