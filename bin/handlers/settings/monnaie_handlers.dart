import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/settings/monnaie_model.dart';
import '../../repository/repository.dart';

class MonnaieHandlers {
  final Repository repos;

  MonnaieHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<MonnaieModel> data = await repos.monnaies.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late MonnaieModel data;
      try {
        data = await repos.monnaies.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-monnaie', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      MonnaieModel data = MonnaieModel( 
        monnaie: input['monnaie'],
        monnaieEnlettre: input['monnaieEnlettre'],
        signature: input['signature'],
        created: DateTime.parse(input['created']) 
      );
      try {
        await repos.monnaies.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-monnaie/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = MonnaieModel.fromJson(input);
      MonnaieModel? data = await repos.monnaies.getFromId(editH.id!);

      if (input['monnaie'] != null) {
        data.monnaie = input['monnaie'];
      }
      if (input['monnaieEnlettre'] != null) {
        data.monnaieEnlettre = input['monnaieEnlettre'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      } 

      repos.monnaies.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-monnaie/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.monnaies.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page monnaie n\'est pas trouvé'),
    );
    return router;
  }
}
