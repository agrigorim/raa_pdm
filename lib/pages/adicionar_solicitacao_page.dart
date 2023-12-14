import 'package:flutter/material.dart';
import 'package:raa_pdm/services/firestore_service.dart ';

class AdicionarSolicitacaoPage extends StatefulWidget {
  const AdicionarSolicitacaoPage({super.key});

  @override
  State<AdicionarSolicitacaoPage> createState() =>
      _AdicionarSolicitacaoPageState();
}

class _AdicionarSolicitacaoPageState extends State<AdicionarSolicitacaoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FireStoreService fireStoreService = FireStoreService();
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  cadastrar(String titulo, String descricao) {
    if (_formKey.currentState!.validate()) {
      fireStoreService.adicionarSolicitacao(titulo, descricao);
    }
    _tituloController.clear();
    _descricaoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
        title: Text('Nova Solicitação'),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                cadastrar(_tituloController.text, _descricaoController.text);
              }
            },
            child: Text('Cadastrar'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Título obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Descrição obrigatória';
                  }
                  return null;
                },
              ),
              //colocar em algum lugar o botão pra camera
            ],
          ),
        ),
      ),
    );
  }
}
