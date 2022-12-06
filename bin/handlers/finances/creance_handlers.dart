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
          statutPaie: input['statutPaie'],
          signature: input['signature'], 
          created: DateTime.parse(input['created']),
          approbationDG: input['approbationDG'],
          motifDG: input['motifDG'],
          signatureDG: input['signatureDG'],
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD']);
      try {
        await repos.creances.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-creance/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = CreanceModel.fromJson(input);
      CreanceModel? data =
          await repos.creances.getFromId(editH.id!); 

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
        data.statutPaie = input['statutPaie'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
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
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }

      repos.creances.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-creance/<id>',
        (Request request, String id) async {
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
