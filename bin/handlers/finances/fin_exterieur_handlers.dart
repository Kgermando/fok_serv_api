import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/finances/fin_exterieur_model.dart';
import '../../repository/repository.dart';

class FinExterieurHandlers {
  final Repository repos;

  FinExterieurHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<FinanceExterieurModel> data = await repos.finExterieurs.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late FinanceExterieurModel agent;
      try {
        agent = await repos.finExterieurs.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-finExterieur',
        (Request request) async {
      var input = jsonDecode(await request.readAsString());

      FinanceExterieurModel data = FinanceExterieurModel(
          nomComplet: input['nomComplet'],
          pieceJustificative: input['pieceJustificative'],
          libelle: input['libelle'],
          montant: input['montant'], 
          typeOperation: input['typeOperation'],
          numeroOperation: input['numeroOperation'], 
          signature: input['signature'],
          reference: input['reference'],
          financeExterieurName: input['financeExterieurName'],
          created: DateTime.parse(input['created']));
      try {
        await repos.finExterieurs.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-finExterieur/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = FinanceExterieurModel.fromJson(input);
      FinanceExterieurModel? data =
          await repos.finExterieurs.getFromId(editH.id!); 

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['pieceJustificative'] != null) {
        data.pieceJustificative = input['pieceJustificative'];
      }
      if (input['libelle'] != null) {
        data.libelle = input['libelle'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      } 
      if (input['typeOperation'] != null) {
        data.typeOperation = input['typeOperation'];
      }
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['financeExterieurName'] != null) {
        data.financeExterieurName = input['financeExterieurName'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.finExterieurs.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-finExterieur/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.finExterieurs.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page finExterieur n\'est pas trouvé'),
    );

    return router;
  }
}
