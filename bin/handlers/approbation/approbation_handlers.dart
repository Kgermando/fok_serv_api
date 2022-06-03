import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/approbation/approbation_model.dart';
import '../../repository/repository.dart';

class ApprobationHandlers {
  final Repository repos;

  ApprobationHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ApprobationModel> data = await repos.approbations.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ApprobationModel data;
      try {
        data = await repos.approbations.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-approbation', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ApprobationModel data = ApprobationModel(
        reference: DateTime.parse(input['reference']),
        title: input['title'],
        departement: input['departement'],
        fontctionOccupee: input['fontctionOccupee'],
        ligneBudgtaire: input['ligneBudgtaire'],
        resources: input['resources'],
        approbation: input['approbation'],
        justification: input['justification'],
        signature: input['signature'], 
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.approbations.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-approbation/<id>', (Request request, String id) async {
      var id = request.params['id'];
      ApprobationModel data = await repos.approbations.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['reference'] != null) {
        data.reference = DateTime.parse(input['reference']);
      }
      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['fontctionOccupee'] != null) {
        data.fontctionOccupee = input['fontctionOccupee'];
      }
      if (input['ligneBudgtaire'] != null) {
        data.ligneBudgtaire = input['ligneBudgtaire'];
      }
      if (input['resources'] != null) {
        data.resources = input['resources'];
      }
      if (input['approbation'] != null) {
        data.approbation = input['approbation'];
      }
      if (input['justification'] != null) {
        data.justification = input['justification'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.approbations.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-approbation/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.approbations.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page approbations n\'est pas trouvé'),
    );

    return router;
  }
}