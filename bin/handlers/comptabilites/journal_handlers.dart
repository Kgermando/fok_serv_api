import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/journal_model.dart';
import '../../repository/repository.dart';

class JournalHandlers {
  final Repository repos;

  JournalHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<JournalModel> data = await repos.journals.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-comptabilite-journal',
        (Request request) async {
      var input = jsonDecode(await request.readAsString());

      JournalModel data = JournalModel(
          titleBilan: input['titleBilan'],
          comptes: input['comptes'],
          intitule: input['intitule'],
          montant: input['montant'],
          typeJournal: input['typeJournal'],
          created: DateTime.parse(input['created']));
      try {
        await repos.journals.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-comptabilite-journal/<id>',
        (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      JournalModel data =
          await repos.journals.getFromId(int.parse(id!));

      if (input['titleBilan'] != null) {
        data.titleBilan = input['titleBilan'];
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['typeJournal'] != null) {
        data.typeJournal = input['typeJournal'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.journals.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-comptabilite-journal/<id>',
        (Request request) async {
      var id = request.params['id'];
      repos.journals.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page journal n\'est pas trouvé'),
    );

    return router;
  }
}
