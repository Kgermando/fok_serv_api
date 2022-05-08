import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/facture_cart_model.dart';
import '../../../repository/repository.dart';

class FactureHandlers {
  final Repository repos;

  FactureHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<FactureCartModel> data = await repos.factures.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late FactureCartModel data;
      try {
        data = await repos.factures.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-facture', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      FactureCartModel data = FactureCartModel(
          cart: input['cart'],
          client: input['client'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.factures.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-facture/<id>', (Request request, String id) async {
      var id = request.params['id'];
      FactureCartModel data = await repos.factures.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['cart'] != null) {
        data.cart = input['cart'];
      }
      if (input['client'] != null) {
        data.client = input['client'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.factures.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-facture/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.factures.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page factures n\'est pas trouvé'),
    );

    return router;
  }
}
