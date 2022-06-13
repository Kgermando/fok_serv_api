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
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
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

    router.put('/update-carburant/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = CarburantModel.fromJson(input);
      CarburantModel? data =
          await repos.carburants.getFromId(editH.id!); 

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
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
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