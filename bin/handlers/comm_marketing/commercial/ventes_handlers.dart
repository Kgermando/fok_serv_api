import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/vente_cart_model.dart';
import '../../../repository/repository.dart';

class VenteHandlers {
  final Repository repos;

  VenteHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<VenteCartModel> data = await repos.ventes.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late VenteCartModel data;
      try {
        data = await repos.ventes.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-vente', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      VenteCartModel data = VenteCartModel(
          idProductCart: input['idProductCart'],
          quantityCart: input['quantityCart'],
          priceTotalCart: input['priceTotalCart'],
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
        await repos.ventes.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-vente/<id>', (Request request, String id) async {
      var id = request.params['id'];
      VenteCartModel data = await repos.ventes.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['idProductCart'] != null) {
        data.idProductCart = input['idProductCart'];
      }
      if (input['quantityCart'] != null) {
        data.quantityCart = input['quantityCart'];
      }
      if (input['priceTotalCart'] != null) {
        data.priceTotalCart = input['priceTotalCart'];
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
      repos.ventes.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-vente/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.ventes.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page ventes n\'est pas trouvé'),
    );

    return router;
  }
}