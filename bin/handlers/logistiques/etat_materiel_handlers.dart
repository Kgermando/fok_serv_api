import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/etat_materiel_model.dart';
import '../../repository/repository.dart';

class EtatMaterielHandlers {
  final Repository repos;

  EtatMaterielHandlers(this.repos);
  
    Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<EtatMaterielModel> data = await repos.etatMateriels.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late EtatMaterielModel etatMaterielModel;
      try {
        etatMaterielModel = await repos.etatMateriels.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(etatMaterielModel.toJson()));
    });

    router.post('/insert-new-etat-materiel', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      EtatMaterielModel etatMaterielModel = EtatMaterielModel(
          nom: input['nom'],
          modele: input['modele'],
          marque: input['marque'],
          typeObjet: input['typeObjet'],
          statut: input['statut'],
          created: DateTime.parse(input['created']),
          signature: input['signature']);

      try {
        await repos.etatMateriels.insertData(etatMaterielModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(etatMaterielModel.toJson()));
    });

    router.put('/update-etat-materiel/<id>', (Request request, String id) async {
      var id = request.params['id'];
      EtatMaterielModel etatMaterielModel = await repos.etatMateriels.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nom'] != null) {
        etatMaterielModel.nom = input['nom'];
      }
      if (input['modele'] != null) {
        etatMaterielModel.modele = input['modele'];
      }
      if (input['marque'] != null) {
        etatMaterielModel.marque = input['marque'];
      }
      if (input['typeObjet'] != null) {
        etatMaterielModel.typeObjet = input['typeObjet'];
      }
      if (input['statut'] != null) {
        etatMaterielModel.statut = input['statut'];
      }
      if (input['created'] != null) {
        etatMaterielModel.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        etatMaterielModel.signature = input['signature'];
      }
      repos.etatMateriels.update(etatMaterielModel);
      return Response.ok(jsonEncode(etatMaterielModel.toJson()));
    });

    router.delete('/delete-etatMateriel/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.etatMateriels.deleteData(int.parse(id!));
      return Response.ok('etatMateriels supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page etatMateriels n\'est pas trouvé'),
    );

    return router;
  }
}