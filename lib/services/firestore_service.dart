import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raa_pdm/models/comentario.dart';
import 'package:raa_pdm/models/solicitacao.dart';
import 'package:raa_pdm/services/auth_service.dart';
import 'package:geolocator/geolocator.dart';

class FireStoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> adicionarSolicitacao(String titulo, String descricao) {
    return _db.collection('solicitacoes').add(
      {
        'titulo': titulo,
        'descricao': descricao,
        'data': DateTime.now(),
        'usuario': AuthService().usuario!.uid,
        //'localizacao':
      },
    );
  }

  Stream<List<Solicitacao>> getSolicitacoes() {
    return _db
        .collection('solicitacoes')
        .orderBy('data', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => doc.data() as Solicitacao).toList());
  }

  Future<void> removerSolicitacao(String id) {
    return _db.collection('solicitacoes').doc(id).delete();
  }

  Future<void> adicionarComentario(String texto, String id) {
    return _db.collection('solicitacoes').doc(id).collection('comentarios').add(
      {
        'texto': texto,
        'data': DateTime.now(),
      },
    );
  }

  Stream<List<Comentario>> getComentarios(String id) {
    return _db
        .collection('solicitacoes')
        .doc(id)
        .collection('comentarios')
        .orderBy('data', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => doc.data() as Comentario).toList());
  }

  Future<void> removerComentario(String id, String idComentario) {
    return _db
        .collection('solicitacoes')
        .doc(id)
        .collection('comentarios')
        .doc(idComentario)
        .delete();
  }
}
