import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/anguin_model.dart';
import '../../repository/repository.dart';

class AnguinHandlers {
  final Repository repos;

  AnguinHandlers(this.repos);
  
  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AnguinModel> data = await repos.anguins.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AnguinModel anguinModel;
      try {
        anguinModel = await repos.anguins.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(anguinModel.toJson()));
    });

    router.post('/insert-new-anguin', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      AnguinModel anguinModel = AnguinModel(
          nom: input['nom'],
          modele: input['modele'],
          marque: input['marque'],
          numeroChassie: input['numeroChassie'],
          couleur: input['couleur'],
          genre: input['genre'],
          qtyMaxReservoir: input['qtyMaxReservoir'],
          dateFabrication: DateTime.parse(input['dateFabrication']),
          nomeroPLaque: input['nomeroPLaque'],
          nomeroEntreprise: input['nomeroEntreprise'],
          kilometrageInitiale: input['kilometrageInitiale'],
          provenance: input['provenance'],
          created: DateTime.parse(input['created']),
          signature: input['signature']);

      try {
        await repos.anguins.insertData(anguinModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(anguinModel.toJson()));
    });

    router.put('/update-anguin/<id>', (Request request, String id) async {
      var id = request.params['id'];
      AnguinModel anguinModel = await repos.anguins.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nom'] != null) {
        anguinModel.nom = input['nom'];
      }
      if (input['modele'] != null) {
        anguinModel.modele = input['modele'];
      }
      if (input['marque'] != null) {
        anguinModel.marque = input['marque'];
      }
      if (input['numeroChassie'] != null) {
        anguinModel.numeroChassie = input['numeroChassie'];
      }
      if (input['couleur'] != null) {
        anguinModel.couleur = input['couleur'];
      }
      if (input['qtyMaxReservoir'] != null) {
        anguinModel.qtyMaxReservoir = input['qtyMaxReservoir'];
      }
      if (input['dateFabrication'] != null) {
        anguinModel.dateFabrication = DateTime.parse(input['dateFabrication']);
      }
      if (input['nomeroPLaque'] != null) {
        anguinModel.nomeroPLaque = input['nomeroPLaque'];
      }
      if (input['nomeroEntreprise'] != null) {
        anguinModel.nomeroEntreprise = input['nomeroEntreprise'];
      }
      if (input['kilometrageInitiale'] != null) {
        anguinModel.kilometrageInitiale = input['kilometrageInitiale'];
      }
      if (input['provenance'] != null) {
        anguinModel.provenance = input['provenance'];
      }
      if (input['created'] != null) {
        anguinModel.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        anguinModel.signature = input['signature'];
      }
      repos.anguins.update(anguinModel);
      return Response.ok(jsonEncode(anguinModel.toJson()));
    });

    router.delete('/delete-anguin/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.anguins.deleteData(int.parse(id!));
      return Response.ok('anguins supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page anguins n\'est pas trouvé'),
    );

    return router;
  }
}