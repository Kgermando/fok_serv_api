import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/finances/depenses_model.dart';
import '../../repository/repository.dart';

class DepensesHandlers {
  final Repository repos;

  DepensesHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<DepensesModel> data = await repos.depenses.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late DepensesModel agent;
      try {
        agent = await repos.depenses.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-depense', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      DepensesModel data = DepensesModel(
          nomComplet: input['nomComplet'],
          pieceJustificative: input['pieceJustificative'],
          naturePayement: input['naturePayement'],
          montant: input['montant'],
          coupureBillet: input['coupureBillet'],
          ligneBudgtaire: input['ligneBudgtaire'],
          modePayement: input['modePayement'],
          numeroOperation: input['numeroOperation'],
          created: DateTime.parse(input['created']),
        signature: input['signature']
      );
      try {
        await repos.depenses.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-depense/<id>', (Request request, String id) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      DepensesModel data = await repos.depenses.getFromId(int.parse(id!));

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['pieceJustificative'] != null) {
        data.pieceJustificative = input['pieceJustificative'];
      }
      if (input['naturePayement'] != null) {
        data.naturePayement = input['naturePayement'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['coupureBillet'] != null) {
        data.coupureBillet = input['coupureBillet'];
      }
      if (input['ligneBudgtaire'] != null) {
        data.ligneBudgtaire = input['ligneBudgtaire'];
      }
      if (input['modePayement'] != null) {
        data.modePayement = input['modePayement'];
      }
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      repos.depenses.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-depense/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.depenses.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page depense n\'est pas trouvé'),
    );

    return router;
  }
}
