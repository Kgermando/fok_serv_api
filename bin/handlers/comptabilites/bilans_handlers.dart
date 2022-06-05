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

    router.get('/<id>', (Request request, String id) async {
      late BilanModel data;
      try {
        data = await repos.bilans.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });
 
    router.post('/insert-new-bilan', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BilanModel data = BilanModel(
        titleBilan: input['titleBilan'],
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.bilans.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-bilan/<id>', (Request request, String id) async {
      var id = request.params['id'];
      BilanModel data = await repos.bilans.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['titleBilan'] != null) {
        data.titleBilan = input['titleBilan'];
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
      repos.bilans.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-bilan/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.bilans.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page bilan n\'est pas trouvé'),
    );

    return router;
  }
}
