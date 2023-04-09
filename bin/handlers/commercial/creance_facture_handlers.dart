import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/creance_cart_model.dart';
import '../../repository/repository.dart';

class CreanceFactureHandlers {
  final Repository repos;

  CreanceFactureHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<CreanceCartModel> data = await repos.creancesFacture.getAllData(business);
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

    router.post('/insert-new-facture-creance', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CreanceCartModel data = CreanceCartModel(
          cart: input['cart'],
          client: input['client'],
          nomClient: input['nomClient'],
          telephone: input['telephone'],
          addresse: input['addresse'],
          delaiPaiement: DateTime.parse(input['delaiPaiement']),
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.creancesFacture.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-facture-creance/', (Request request) async {
           dynamic input = jsonDecode(await request.readAsString());
      final editH = CreanceCartModel.fromJson(input);
      CreanceCartModel? data =
          await repos.creancesFacture.getFromId(editH.id!);

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
      if (input['addresse'] != null) {
        data.addresse = input['addresse'];
      }
      if (input['delaiPaiement'] != null) {
        data.delaiPaiement = DateTime.parse(input['delaiPaiement']);
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

      repos.creancesFacture.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-facture-creance/<id>',
        (Request request, String id) async {
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
