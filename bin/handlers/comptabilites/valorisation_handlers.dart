import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/valorisation_model.dart';
import '../../repository/repository.dart';

class ValorisationHandlers {
  final Repository repos;

  ValorisationHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ValorisationModel> data = await repos.valorisations.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-comptabilite-valorisation',
        (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ValorisationModel data = ValorisationModel(
          numeroOrdre: input['numeroOrdre'],
          intitule: input['intitule'],
          quantite: input['quantite'],
          prixUnitaire: input['prixUnitaire'],
          prixTotal: input['prixTotal'],
          source: input['source'],
          created: DateTime.parse(input['created']));
      try {
        await repos.valorisations.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-comptabilite-valorisation/<id>',
        (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      ValorisationModel data =
          await repos.valorisations.getFromId(int.parse(id!));

      if (input['numeroOrdre'] != null) {
        data.numeroOrdre = input['numeroOrdre'];
      }
      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }
      if (input['quantite'] != null) {
        data.quantite = input['quantite'];
      }
      if (input['prixUnitaire'] != null) {
        data.prixUnitaire = input['prixUnitaire'];
      }
      if (input['prixTotal'] != null) {
        data.prixTotal = input['prixTotal'];
      }
      if (input['source'] != null) {
        data.source = input['source'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.valorisations.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-comptabilite-valorisation/<id>',
        (Request request) async {
      var id = request.params['id'];
      repos.valorisations.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page valorisation n\'est pas trouvé'),
    );

    return router;
  }
}
