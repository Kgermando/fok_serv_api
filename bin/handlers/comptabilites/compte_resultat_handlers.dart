import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/compte_resultat_model.dart';
import '../../repository/repository.dart';

class CompteResultatHandlers {
   final Repository repos;

  CompteResultatHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CompteResulatsModel> data = await repos.comptesResultat.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CompteResulatsModel data;
      try {
        data = await repos.comptesResultat.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-compte-resultat',
        (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CompteResulatsModel data = CompteResulatsModel(
          intitule: input['intitule'],
          compteListDebit: input['compteListDebit'],
          compteListCredit: input['compteListCredit'],
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
        await repos.comptesResultat.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-compte-resultat/<id>',
        (Request request, String id) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      CompteResulatsModel data =
          await repos.comptesResultat.getFromId(int.parse(id!));

      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }
      if (input['compteListDebit'] != null) {
        data.compteListDebit = input['compteListDebit'];
      }
      if (input['compteListCredit'] != null) {
        data.compteListCredit = input['compteListCredit'];
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
      repos.comptesResultat.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-compte-resultat/<id>',
        (String id, Request request) async {
      var id = request.params['id'];
      repos.comptesResultat.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page compte-resultat n\'est pas trouvé'),
    );

    return router;
  }
}