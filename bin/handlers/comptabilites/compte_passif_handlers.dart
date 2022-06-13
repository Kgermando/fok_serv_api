import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/compte_passif_model.dart';
import '../../repository/repository.dart';

class ComptePassifHandlers {
  final Repository repos;

  ComptePassifHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ComptePassifModel> data = await repos.comptePassif.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ComptePassifModel data;
      try {
        data = await repos.comptePassif.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });
 
    router.post('/insert-new-compte-passif', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ComptePassifModel data = ComptePassifModel(
        reference: DateTime.parse(input['reference']),
        comptes: input['comptes'],
        montant: input['montant'],
      );
      try {
        await repos.comptePassif.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-compte-passif/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ComptePassifModel.fromJson(input);
      ComptePassifModel? data =
          await repos.comptePassif.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = DateTime.parse(input['reference']);
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      
      repos.comptePassif.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-compte-passif/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.comptePassif.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page comptes n\'est pas trouvé'),
    );

    return router;
  }
}
