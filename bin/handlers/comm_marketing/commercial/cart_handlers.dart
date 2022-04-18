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
          created: DateTime.parse(input['created']),
          telephone: input['telephone'],
          succursale: input['succursale'],
          nameBusiness: input['nameBusiness'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise']
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
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['telephone'] != null) {
        data.telephone = input['telephone'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['nameBusiness'] != null) {
        data.nameBusiness = input['nameBusiness'];
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
      repos.carts.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-cart/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.carts.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page carts n\'est pas trouvé'),
    );

    return router;
  }
}