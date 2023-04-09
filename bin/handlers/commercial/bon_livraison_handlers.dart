import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/commercial/bon_livraison.dart';
import '../../repository/repository.dart';

class BonLivraisonHandlers {
  final Repository repos;

  BonLivraisonHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<BonLivraisonModel> data = await repos.bonLivraison.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late BonLivraisonModel data;
      try {
        data = await repos.bonLivraison.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-bon-livraison', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BonLivraisonModel data = BonLivraisonModel(
          idProduct: input['idProduct'],
          quantityAchat: input['quantityAchat'],
          priceAchatUnit: input['priceAchatUnit'],
          prixVenteUnit: input['prixVenteUnit'],
          unite: input['unite'],
          firstName: input['firstName'],
          lastName: input['lastName'],
          tva: input['tva'],
          remise: input['remise'],
          qtyRemise: input['qtyRemise'],
          accuseReception: input['accuseReception'],
          accuseReceptionFirstName: input['accuseReceptionFirstName'],
          accuseReceptionLastName: input['accuseReceptionLastName'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.bonLivraison.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-bon-livraison/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = BonLivraisonModel.fromJson(input);
      BonLivraisonModel? data =
          await repos.bonLivraison.getFromId(editH.id!); 

      if (input['idProduct'] != null) {
        data.idProduct = input['idProduct'];
      }
      if (input['quantityAchat'] != null) {
        data.quantityAchat = input['quantityAchat'];
      }
      if (input['priceAchatUnit'] != null) {
        data.priceAchatUnit = input['priceAchatUnit'];
      }
      if (input['prixVenteUnit'] != null) {
        data.prixVenteUnit = input['prixVenteUnit'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['firstName'] != null) {
        data.firstName = input['firstName'];
      }
      if (input['lastName'] != null) {
        data.lastName = input['lastName'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      }
      if (input['remise'] != null) {
        data.remise = input['remise'];
      }
      if (input['accuseReception'] != null) {
        data.accuseReception = input['accuseReception'];
      }
      if (input['accuseReceptionFirstName'] != null) {
        data.accuseReceptionFirstName = input['accuseReceptionFirstName'];
      }
      if (input['accuseReceptionLastName'] != null) {
        data.accuseReceptionLastName = input['accuseReceptionLastName'];
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

      repos.bonLivraison.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-bon-livraison/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.bonLivraison.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page bon-livraison n\'est pas trouvé'),
    );

    return router;
  }
}
