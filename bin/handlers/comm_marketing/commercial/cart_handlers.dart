import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/cart_model.dart';
import '../../../repository/repository.dart';

class CartHandlers {
  final Repository repos;

  CartHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<CartModel> data = await repos.carts.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CartModel data;
      try {
        data = await repos.carts.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-cart', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CartModel data = CartModel(
          idProductCart: input['idProductCart'],
          quantityCart: input['quantityCart'],
          priceCart: input['priceCart'],
          priceAchatUnit: input['priceAchatUnit'],
          unite: input['unite'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created'])
        );
      try {
        await repos.carts.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-cart/<id>', (Request request, String id) async {
      var id = request.params['id'];
      CartModel data = await repos.carts.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['idProductCart'] != null) {
        data.idProductCart = input['idProductCart'];
      }
      if (input['quantityCart'] != null) {
        data.quantityCart = input['quantityCart'];
      }
      if (input['priceCart'] != null) {
        data.priceCart = input['priceCart'];
      }
      if (input['priceAchatUnit'] != null) {
        data.priceAchatUnit = input['priceAchatUnit'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      }
      if (input['remise'] != null) {
        data.remise = input['remise'];
      }
      if (input['qtyRemise'] != null) {
        data.qtyRemise = input['qtyRemise'];
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
      repos.carts.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-cart/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.carts.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.delete('/delete-all-cart/<succursale>', (Request request, String succursale) async {
      var succursale = request.params['succursale'];
      repos.carts.deleteAllData(succursale!);
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page cart n\'est pas trouvé'),
    );

    return router;
  }
}