import 'package:flutter/material.dart';
import 'package:raa_pdm/models/solicitacao.dart';

class SolicitacaoPage extends StatefulWidget {
  final Solicitacao solicitacao;

  const SolicitacaoPage({Key? key, required this.solicitacao})
      : super(key: key);

  @override
  State<SolicitacaoPage> createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_left)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.solicitacao.descricao),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.solicitacao.data.toString()),
            ),
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.solicitacao.imagem),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.solicitacao.geolocalizacao),
            ),*/
            Padding(
              padding: const EdgeInsets.all(16.0),
            ),
          ],
        ),
      ),
    );
  }
}
