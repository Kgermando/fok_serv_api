import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
  
import '../../models/finances/fin_exterieur_name_model.dart';
import '../../repository/repository.dart';

class FinExterieurNameHandlers {
  final Repository repos;

  FinExterieurNameHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<FinExterieurNameModel> data = await repos.finExterieurNames.getAllData();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/<id>', (Request request, String id) async {
      late FinExterieurNameModel agent;
      try {
        agent = await repos.finExterieurNames.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-fin-exterieur', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      FinExterieurNameModel data = FinExterieurNameModel(
          nomComplet: input['nomComplet'],
          rccm: input['rccm'],
          idNat: input['idNat'],
          addresse: input['addresse'],
          created: DateTime.parse(input['created']));
      try {
        await repos.finExterieurNames.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-fin-exterieur/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = FinExterieurNameModel.fromJson(input);
      FinExterieurNameModel? data =
          await repos.finExterieurNames.getFromId(editH.id!); 

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['rccm'] != null) {
        data.rccm = input['rccm'];
      }
      if (input['idNat'] != null) {
        data.idNat = input['idNat'];
      }
      if (input['addresse'] != null) {
        data.addresse = input['addresse'];
      }  
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.finExterieurNames.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-fin-exterieur/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.finExterieurNames.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page banque n\'est pas trouvé'),
    );

    return router;
  }
}
