import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/carburant_model.dart';
import '../../repository/repository.dart';

class CarburantHandlers {
  final Repository repos;

  CarburantHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CarburantModel> data = await repos.carburants.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CarburantModel carburantModel;
      try {
        carburantModel = await repos.carburants.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(carburantModel.toJson()));
    });

    router.post('/insert-new-carburant', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      CarburantModel carburantModel = CarburantModel(
        operationEntreSortie: input['operationEntreSortie'],
        typeCaburant: input['typeCaburant'],
        fournisseur: input['fournisseur'],
        nomeroFactureAchat: input['nomeroFactureAchat'],
        prixAchatParLitre: input['prixAchatParLitre'],
        nomReceptioniste: input['nomReceptioniste'],
        numeroPlaque: input['numeroPlaque'],
        dateHeureSortieAnguin: DateTime.parse(input['dateHeureSortieAnguin']),
        qtyAchat: input['qtyAchat'],
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
        await repos.carburants.insertData(carburantModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(carburantModel.toJson()));
    });

    router.put('/update-carburant/<id>', (Request request, String id) async {
      var id = request.params['id'];
      CarburantModel data = await repos.carburants.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['operationEntreSortie'] != null) {
        data.operationEntreSortie = input['operationEntreSortie'];
      }
      if (input['typeCaburant'] != null) {
        data.typeCaburant = input['typeCaburant'];
      }
      if (input['fournisseur'] != null) {
        data.fournisseur = input['fournisseur'];
      }
      if (input['nomeroFactureAchat'] != null) {
        data.nomeroFactureAchat = input['nomeroFactureAchat'];
      }
      if (input['prixAchatParLitre'] != null) {
        data.prixAchatParLitre = input['prixAchatParLitre'];
      }
      if (input['nomReceptioniste'] != null) {
        data.nomReceptioniste = input['nomReceptioniste'];
      }
      if (input['numeroPlaque'] != null) {
        data.numeroPlaque = input['numeroPlaque'];
      }
      if (input['dateFabrication'] != null) {
        data.dateHeureSortieAnguin = DateTime.parse(input['dateHeureSortieAnguin']);
      }
      if (input['qtyAchat'] != null) {
        data.qtyAchat = input['qtyAchat'];
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


      repos.carburants.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-carburant/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.carburants.deleteData(int.parse(id!));
      return Response.ok('carburant supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page carburant n\'est pas trouvé'),
    );

    return router;
  }
}