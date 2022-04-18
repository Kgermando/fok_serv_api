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
          qtyEntreSortie: input['qtyEntreSortie'],
          typeCaburant: input['typeCaburant'],
          fournisseur: input['fournisseur'],
          nomeroFactureAchat: input['nomeroFactureAchat'],
          prixAchatParLitre: input['prixAchatParLitre'],
          nomReceptioniste: input['nomReceptioniste'],
          numeroPlaque: input['numeroPlaque'],
          dateHeureSortieAnguin: DateTime.parse(input['dateHeureSortieAnguin']),
          created: DateTime.parse(input['created']),
          signature: input['signature']);
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
      CarburantModel carburantModel = await repos.carburants.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['qtyEntreSortie'] != null) {
        carburantModel.qtyEntreSortie = input['qtyEntreSortie'];
      }
      if (input['typeCaburant'] != null) {
        carburantModel.typeCaburant = input['typeCaburant'];
      }
      if (input['fournisseur'] != null) {
        carburantModel.fournisseur = input['fournisseur'];
      }
      if (input['nomeroFactureAchat'] != null) {
        carburantModel.nomeroFactureAchat = input['nomeroFactureAchat'];
      }
      if (input['prixAchatParLitre'] != null) {
        carburantModel.prixAchatParLitre = input['prixAchatParLitre'];
      }
      if (input['nomReceptioniste'] != null) {
        carburantModel.nomReceptioniste = input['nomReceptioniste'];
      }
      if (input['numeroPlaque'] != null) {
        carburantModel.numeroPlaque = input['numeroPlaque'];
      }
      if (input['dateFabrication'] != null) {
        carburantModel.dateHeureSortieAnguin = DateTime.parse(input['dateHeureSortieAnguin']);
      }
      if (input['created'] != null) {
        carburantModel.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        carburantModel.signature = input['signature'];
      }
      repos.carburants.update(carburantModel);
      return Response.ok(jsonEncode(carburantModel.toJson()));
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