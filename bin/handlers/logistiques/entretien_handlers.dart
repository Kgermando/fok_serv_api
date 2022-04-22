import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/entretien_model.dart';
import '../../repository/repository.dart';

class EntretienHandlers {
  final Repository repos;

  EntretienHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<EntretienModel> data = await repos.entretiens.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late EntretienModel entretienModel;
      try {
        entretienModel = await repos.entretiens.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(entretienModel.toJson()));
    });

    router.post('/insert-new-entretien', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      EntretienModel entretienModel = EntretienModel(
          nom: input['nom'],
          modele: input['modele'],
          marque: input['marque'],
          etatObjet: input['etatObjet'],
          objetRemplace: input['objetRemplace'],
          dureeTravaux: input['dureeTravaux'],
          approbationDG: input['approbationDG'],
          signatureDG: input['signatureDG'],
          signatureJustificationDG: input['signatureJustificationDG'],
          approbationFin: input['approbationFin'],
          signatureFin: input['signatureFin'],
          signatureJustificationFin: input['signatureJustificationFin'],
          approbationBudget: input['approbationBudget'],
          signatureBudget: input['signatureBudget'],
          signatureJustificationBudget: input['signatureJustificationBudget'],
          approbationDD: input['approbationDD'],
          signatureDD: input['signatureDD'],
          signatureJustificationDD: input['signatureJustificationDD'],
          signature: input['signature'],
          created: DateTime.parse(input['created'])
      );

      try {
        await repos.entretiens.insertData(entretienModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(entretienModel.toJson()));
    });

    router.put('/update-entretien/<id>', (Request request, String id) async {
      var id = request.params['id'];
      EntretienModel data = await repos.entretiens.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['modele'] != null) {
        data.modele = input['modele'];
      }
      if (input['marque'] != null) {
        data.marque = input['marque'];
      }
      if (input['etatObjet'] != null) {
        data.etatObjet = input['etatObjet'];
      }
      if (input['objetRemplace'] != null) {
        data.objetRemplace = input['objetRemplace'];
      }
      if (input['dureeTravaux'] != null) {
        data.dureeTravaux = input['dureeTravaux'];
      }
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }

      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      
      repos.entretiens.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-entretien/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.entretiens.deleteData(int.parse(id!));
      return Response.ok('entretiens supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page entretiens n\'est pas trouvé'),
    );

    return router;
  }
}