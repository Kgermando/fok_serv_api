import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/compte_actif_model.dart';
import '../../repository/repository.dart';

class CompteActifHandlers {
  final Repository repos;

  CompteActifHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CompteActifModel> data = await repos.compteActif.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CompteActifModel data;
      try {
        data = await repos.compteActif.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });
 
    router.post('/insert-new-comptes-actif', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CompteActifModel data = CompteActifModel(
        reference: DateTime.parse(input['reference']),
        comptes: input['comptes'],
        montant: input['montant'],
      );
      try {
        await repos.compteActif.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-comptes-actif/<id>', (Request request, String id) async {
      var id = request.params['id'];
      CompteActifModel data = await repos.compteActif.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['reference'] != null) {
        data.reference = DateTime.parse(input['reference']);
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      
      repos.compteActif.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-comptes-actif/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.compteActif.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page comptes n\'est pas trouvé'),
    );

    return router;
  }
}
