import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/perfomence_model.dart';
import '../../repository/repository.dart';

class PerformenceHandlers {
  final Repository repos;

  PerformenceHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PerformenceModel> data = await repos.performences.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late PerformenceModel data;
      try {
        data = await repos.performences.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });


    router.post('/insert-new-performence', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PerformenceModel data = PerformenceModel(
          agent: input['agent'],
          departement: input['departement'],
          nom: input['nom'],
          postnom: input['postnom'],
          prenom: input['prenom'], 
          signature: input['signature'],
          created: DateTime.parse(input['created']));

      try {
        await repos.performences.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-performence/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PerformenceModel data = await repos.performences.getFromId(int.parse(id!));

      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['postnom'] != null) {
        data.postnom = input['postnom'];
      }
      if (input['prenom'] != null) {
        data.prenom = input['prenom'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.performences.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-performence/<id>', (Request request) async {
      var id = request.params['id'];
      repos.performences.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page performences n\'est pas trouvé'),
    );
    return router;
  }
}