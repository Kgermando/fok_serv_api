import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comm_maketing/prod_model.dart';
import '../../repository/repository.dart';

class ProduitModelHandlers {
  final Repository repos;

  ProduitModelHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ProductModel> data = await repos.produitModel.getAllData();
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
        categorie: input['categorie'],
        sousCategorie1: input['sousCategorie1'],
        sousCategorie2: input['sousCategorie2'],
        sousCategorie3: input['sousCategorie3'],
        sousCategorie4: input['sousCategorie4'],
        idProduct: input['idProduct'],
        signature: input['signature'],
        created: DateTime.parse(input['created']),
        approbationDD: input['approbationDD'],
        motifDD: input['motifDD'],
        signatureDD: input['signatureDD']
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
          
      if (input['categorie'] != null) {
        data.categorie = input['categorie'];
      }
      if (input['sousCategorie1'] != null) {
        data.sousCategorie1 = input['sousCategorie1'];
      }
      if (input['sousCategorie2'] != null) {
        data.sousCategorie2 = input['sousCategorie2'];
      }
      if (input['sousCategorie3'] != null) {
        data.sousCategorie3 = input['sousCategorie3'];
      }
      if (input['sousCategorie4'] != null) {
        data.sousCategorie4 = input['sousCategorie4'];
      }
      if (input['idProduct'] != null) {
        data.idProduct = input['idProduct'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
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
