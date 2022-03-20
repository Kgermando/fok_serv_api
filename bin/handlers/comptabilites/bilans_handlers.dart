import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/bilan_model.dart';
import '../../repository/repository.dart';

class BilansHandlers {
  final Repository repos;

  BilansHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<BilanModel> data = await repos.bilans.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-comptabilite-bilan',
        (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BilanModel data = BilanModel(
          titleBilan: input['titleBilan'],
          comptes: input['comptes'],
          intitule: input['intitule'],
          montant: input['montant'],
          typeBilan: input['typeBilan'],
          created: DateTime.parse(input['created']));
      try {
        await repos.bilans.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-comptabilite-bilan/<id>',
        (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      BilanModel data =
          await repos.bilans.getFromId(int.parse(id!));

      if (input['titleBilan'] != null) {
        data.titleBilan = input['titleBilan'];
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['typeBilan'] != null) {
        data.typeBilan = input['typeBilan'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.bilans.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-comptabilite-bilan/<id>',
        (Request request) async {
      var id = request.params['id'];
      repos.bilans.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page bilan n\'est pas trouvé'),
    );

    return router;
  }
}
