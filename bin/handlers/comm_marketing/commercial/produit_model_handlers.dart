import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/prod_model.dart';
import '../../../repository/repository.dart';

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
        approbationDG: input['approbationDG'],
        signatureDG: input['signatureDG'],
        signatureJustificationDG: input['signatureJustificationDG'],
        approbationFin: input['approbationFin'],
        signatureFin: input['signatureFin'],
        signatureJustificationFin: input['signatureJustificationFin'],
        approbationBudget: input['approbationBudget'],
        signatureBudget: input['signatureBudget'],
        signatureJustificationBudget: input['signatureJustificationBudget'],
        approbationDD: input['approbationDD'],
        signatureDD: input['signatureDD'],
        signatureJustificationDD: input['signatureJustificationDD'],
        signature: input['signature'],
        created: DateTime.parse(input['created'])  
          
      );
      try {
        await repos.produitModel.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-produit-model/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      ProductModel data = await repos.produitModel.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

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
       if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }
       if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.produitModel.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-produit-model/<id>',
        (String id, Request request) async {
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
