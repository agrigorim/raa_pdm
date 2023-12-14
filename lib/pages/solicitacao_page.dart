import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return const Placeholder();
  }
}
