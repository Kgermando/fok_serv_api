import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/creance_cart_model.dart';
import '../../../repository/repository.dart';

class CreanceFactureHandlers {
   final Repository repos;

  CreanceFactureHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CreanceCartModel> data = await repos.creancesFacture.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CreanceCartModel data;
      try {
        data = await repos.creancesFacture.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-creance', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CreanceCartModel data = CreanceCartModel(
          cart: input['cart'],
          client: input['client'],
          created: DateTime.parse(input['created']),
          telephone: input['telephone'],
          succursale: input['succursale'],
          nameBusiness: input['nameBusiness']
        );
      try {
        await repos.creancesFacture.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-creance/<id>', (Request request, String id) async {
      var id = request.params['id'];
      CreanceCartModel data = await repos.creancesFacture.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['cart'] != null) {
        data.cart = input['cart'];
      }
      if (input['client'] != null) {
        data.client = input['client'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      
      repos.creancesFacture.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-creance/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.creancesFacture.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page creances n\'est pas trouvé'),
    );

    return router;
  }
}