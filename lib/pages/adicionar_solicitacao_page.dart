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
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  cadastrar() {
    if (_formKey.currentState!.validate()) {
      fireStoreService.adicionarSolicitacao(
          tituloController.text, descricaoController.text);
    }
    tituloController.clear();
    descricaoController.clear();
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
                cadastrar();
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
                controller: tituloController,
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
                controller: descricaoController,
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
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt),
                  label: Text('Tirar foto')),
            ],
          ),
        ),
      ),
    );
  }
}
