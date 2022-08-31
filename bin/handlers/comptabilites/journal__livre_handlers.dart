import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/journal_livre_model.dart';
import '../../repository/repository.dart';

class JournalLivreHandlers {
  final Repository repos;

  JournalLivreHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<JournalLivreModel> data = await repos.journalLivres.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late JournalLivreModel data;
      try {
        data = await repos.journalLivres.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-journal-livre', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      JournalLivreModel data = JournalLivreModel(
          intitule: input['intitule'],
          debut: DateTime.parse(input['debut']),
          fin: DateTime.parse(input['fin']),
          signature: input['signature'],
          created: DateTime.parse(input['created']),
          approbationDG: input['approbationDG'],
          motifDG: input['motifDG'],
          signatureDG: input['signatureDG'],
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD']);
      try {
        await repos.journalLivres.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-journal-livre/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = JournalLivreModel.fromJson(input);
      JournalLivreModel? data = await repos.journalLivres.getFromId(editH.id!);

      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }
      if (input['debut'] != null) {
        data.debut = DateTime.parse(input['debut']);
      }
      if (input['fin'] != null) {
        data.fin = DateTime.parse(input['fin']);
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

      repos.journalLivres.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-journal-livre/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.journalLivres.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page journal livre n\'est pas trouvé'),
    );

    return router;
  }
}
