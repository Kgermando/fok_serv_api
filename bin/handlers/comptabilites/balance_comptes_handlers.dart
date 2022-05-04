import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/balance_comptes_model.dart';
import '../../repository/repository.dart';

class BalanceComptesHandlers {
   final Repository repos;

  BalanceComptesHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<BalanceCompteModel> data = await repos.balanceComptes.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late BalanceCompteModel data;
      try {
        data = await repos.balanceComptes.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-balance-compte',
        (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BalanceCompteModel data = BalanceCompteModel(
          comptes: input['comptes'],
          statut: input['statut'] as bool,
          approbationDG: input['approbationDG'],
          signatureDG: input['signatureDG'],
          signatureJustificationDG: input['signatureJustificationDG'],
          approbationDD: input['approbationDD'],
          signatureDD: input['signatureDD'],
          signatureJustificationDD: input['signatureJustificationDD'],
          signature: input['signature'],
          created: DateTime.parse(input['created'])
      );
      try {
        await repos.balanceComptes.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-balance-compte/<id>',
        (Request request, String id) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      BalanceCompteModel data =
          await repos.balanceComptes.getFromId(int.parse(id!));

      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['statut'] != null) {
        data.statut = input['statut'] as bool;
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
      repos.balanceComptes.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-balance-compte/<id>',
        (String id, Request request) async {
      var id = request.params['id'];
      repos.balanceComptes.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page bilan n\'est pas trouvé'),
    );

    return router;
  }
}