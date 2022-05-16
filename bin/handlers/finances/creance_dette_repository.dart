import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/finances/creance_dette_model.dart';
import '../../repository/repository.dart';

class BanqueHandlers {
  final Repository repos;

  BanqueHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CreanceDetteModel> data = await repos.creanceDette.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CreanceDetteModel data;
      try {
        data = await repos.creanceDette.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-creance-dette', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CreanceDetteModel data = CreanceDetteModel(
          nomComplet: input['nomComplet'],
          pieceJustificative: input['pieceJustificative'],
          libelle: input['libelle'],
          montant: input['montant'],
          creanceDette: input['creanceDette'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.creanceDette.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-creance-dette/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      CreanceDetteModel data = await repos.creanceDette.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['pieceJustificative'] != null) {
        data.pieceJustificative = input['pieceJustificative'];
      }
      if (input['libelle'] != null) {
        data.libelle = input['libelle'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['creanceDette'] != null) {
        data.creanceDette = input['creanceDette'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.creanceDette.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-creance-dette/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.creanceDette.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page creance-dette n\'est pas trouvé'),
    );

    return router;
  }
}
