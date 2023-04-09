import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/facture_cart_model.dart';
import '../../repository/repository.dart';

class FactureHandlers {
  final Repository repos;

  FactureHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<FactureCartModel> data = await repos.factures.getAllData(business);
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
          nomClient: input['nomClient'],
          telephone: input['telephone'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.factures.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-facture/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = FactureCartModel.fromJson(input);
      FactureCartModel? data =
          await repos.factures.getFromId(editH.id!); 

      if (input['cart'] != null) {
        data.cart = input['cart'];
      }
      if (input['client'] != null) {
        data.client = input['client'];
      }
      if (input['nomClient'] != null) {
        data.nomClient = input['nomClient'];
      }
      if (input['telephone'] != null) {
        data.telephone = input['telephone'];
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
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
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
