import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/balance_comptes_model.dart';
import '../../repository/repository.dart';

class ComptesBalanceRefHandlers {
  final Repository repos;

  ComptesBalanceRefHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CompteBalanceRef> data = await repos.balanceCompteRef.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CompteBalanceRef data;
      try {
        data = await repos.balanceCompteRef.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-comptes-balance-ref', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      CompteBalanceRef data = CompteBalanceRef(
          reference: DateTime.parse(input['reference']),
          comptes: input['comptes'],
          debit: input['debit'],
           credit: input['credit'],
            solde: input['solde']
      );
      try {
        await repos.balanceCompteRef.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-comptes-balance-ref/<id>', (Request request, String id) async {
      var id = request.params['id'];
      CompteBalanceRef data = await repos.balanceCompteRef.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['reference'] != null) {
        data.reference = DateTime.parse(input['reference']);
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['debit'] != null) {
        data.debit = input['debit'];
      }
      if (input['credit'] != null) {
        data.credit = input['credit'];
      }
      if (input['solde'] != null) {
        data.solde = input['solde'];
      }

      repos.balanceCompteRef.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-comptes-balance-ref/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.balanceCompteRef.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Agent Role n\'est pas trouvé'),
    );
    return router;
  }
}
