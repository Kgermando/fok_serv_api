import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/finances/creances_model.dart';
import '../../repository/repository.dart';

class CreanceHandlers {
  final Repository repos;

  CreanceHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CreanceModel> data = await repos.creances.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CreanceModel agent;
      try {
        agent = await repos.creances.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-creance', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CreanceModel data = CreanceModel(
        nomComplet: input['nomComplet'],
        pieceJustificative: input['pieceJustificative'],
        libelle: input['libelle'],
        montant: input['montant'],
        numeroOperation: input['numeroOperation'],
        statutPaie: input['statutPaie'] as bool,
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created'])
        );
      try {
        await repos.creances.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-creance/<id>', (Request request, String id) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      CreanceModel data = await repos.creances.getFromId(int.parse(id!));

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
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      }
      if (input['statutPaie'] != null) {
        data.statutPaie = input['statutPaie'] as bool;
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
      repos.creances.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-creance/<id>', (String id,Request request ) async {
      var id = request.params['id'];
      repos.creances.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page creance n\'est pas trouvé'),
    );

    return router;
  }
}
