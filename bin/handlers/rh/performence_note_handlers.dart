import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/perfomence_model.dart';
import '../../repository/repository.dart';

class PerformenceNoteHandlers {
  final Repository repos;

  PerformenceNoteHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PerformenceNoteModel> data = await repos.performencesNote.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-performence-note', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PerformenceNoteModel data = PerformenceNoteModel(
          agent: input['agent'],
          departement: input['departement'],
          hospitalite: input['hospitalite'],
          ponctualite: input['ponctualite'],
          travaille: input['travaille'],
          note: input['note'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));

      try {
        await repos.performencesNote.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-performence-note/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PerformenceNoteModel data = await repos.performencesNote.getFromId(int.parse(id!));

      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['hospitalite'] != null) {
        data.hospitalite = input['hospitalite'];
      }
      if (input['ponctualite'] != null) {
        data.ponctualite = input['ponctualite'];
      }
      if (input['travaille'] != null) {
        data.travaille = input['travaille'];
      }
      if (input['note'] != null) {
        data.note = input['note'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.performencesNote.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-performence-note/<id>', (Request request) async {
      var id = request.params['id'];
      repos.performencesNote.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page performences note n\'est pas trouvé'),
    );
    return router;
  }
}