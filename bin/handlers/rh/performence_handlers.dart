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

    router.post('/insert-new-performence', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PerformenceModel data = PerformenceModel(
          agent: input['agent'],
          hospitalite: input['hospitalite'],
          ponctualite: input['ponctualite'],
          travaille: input['travaille'],
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
      if (input['hospitalite'] != null) {
        data.hospitalite = input['hospitalite'];
      }
      if (input['ponctualite'] != null) {
        data.ponctualite = input['ponctualite'];
      }
      if (input['travaille'] != null) {
        data.travaille = input['travaille'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.performences.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-performence/<id>', (Request request) async {
      var id = request.params['id'];
      repos.salaires.deleteData(int.parse(id!));
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