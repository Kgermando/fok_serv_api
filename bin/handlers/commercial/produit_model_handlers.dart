import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/prod_model.dart';
import '../../repository/repository.dart';

class ProduitModelHandlers {
  final Repository repos;

  ProduitModelHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<ProductModel> data = await repos.produitModel.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ProductModel data;
      try {
        data = await repos.produitModel.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-produit-model', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ProductModel data = ProductModel(
        service: input['service'],
        identifiant: input['identifiant'],
        unite: input['unite'],
        price: input['price'],
        idProduct: input['idProduct'],
        signature: input['signature'], 
        created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.produitModel.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-produit-model/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ProductModel.fromJson(input);
      ProductModel? data =
          await repos.produitModel.getFromId(editH.id!); 
          
      if (input['service'] != null) {
        data.service = input['service'];
      }
      if (input['identifiant'] != null) {
        data.identifiant = input['identifiant'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['price'] != null) {
        data.price = input['price'];
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
      repos.produitModel.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-produit-model/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.produitModel.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page produit-model n\'est pas trouvé'),
    );

    return router;
  }
}
