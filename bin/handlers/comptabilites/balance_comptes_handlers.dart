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

    router.post('/insert-new-balance-compte', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BalanceCompteModel data = BalanceCompteModel(
        title: input['title'], 
        statut: input['statut'],
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created']),
        isSubmit: input['isSubmit'],
        approbationDG: input['approbationDG'],
        motifDG: input['motifDG'],
        signatureDG: input['signatureDG'],
        approbationDD: input['approbationDD'],
        motifDD: input['motifDD'],
        signatureDD: input['signatureDD']
      );
      try {
        await repos.balanceComptes.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-balance-compte/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = BalanceCompteModel.fromJson(input);
      BalanceCompteModel? data =
          await repos.balanceComptes.getFromId(editH.id!); 

      if (input['title'] != null) {
        data.title = input['title'];
      } 
      if (input['statut'] != null) {
        data.statut = input['statut'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['isSubmit'] != null) {
        data.isSubmit = input['isSubmit'];
      }
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['motifDG'] != null) {
        data.motifDG = input['motifDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      repos.balanceComptes.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-balance-compte/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.balanceComptes.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page bilan n\'est pas trouvé'),
    );

    return router;
  }
}
