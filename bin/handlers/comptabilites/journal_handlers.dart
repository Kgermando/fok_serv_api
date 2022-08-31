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

    router.get('/<id>', (Request request, String id) async {
      late JournalModel data;
      try {
        data = await repos.journals.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-journal', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      JournalModel data = JournalModel(
        reference: input['reference'],
        numeroOperation: input['numeroOperation'],
        libele: input['libele'],
        compte: input['compte'],
        montantDebit: input['montantDebit'], 
        montantCredit: input['montantCredit'],
        tva: input['tva'], 
        type: input['type'], 
        created: DateTime.parse(input['created']), 
      );
      try {
        await repos.journals.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-journal/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = JournalModel.fromJson(input);
      JournalModel? data =
          await repos.journals.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      }
      if (input['libele'] != null) {
        data.libele = input['libele'];
      }
      if (input['compte'] != null) {
        data.compte = input['compte'];
      }
      if (input['montantDebit'] != null) {
        data.montantDebit = input['montantDebit'];
      } 
      if (input['montantCredit'] != null) {
        data.montantCredit = input['montantCredit'];
      }
      if (input['tva'] != null) {
        data.tva = input['tva'];
      } 
      if (input['type'] != null) {
        data.type = input['type'];
      }  
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      } 
      repos.journals.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-journal/<id>', (Request request, String id) async {
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
