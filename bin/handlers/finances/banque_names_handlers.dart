import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/finances/banque_name_model.dart';
import '../../repository/repository.dart';

class BanqueNameHandlers {
  final Repository repos;

  BanqueNameHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<BanqueNameModel> data = await repos.banqueNames.getAllData();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/<id>', (Request request, String id) async {
      late BanqueNameModel agent;
      try {
        agent = await repos.banqueNames.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-banque', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BanqueNameModel data = BanqueNameModel(
          nomComplet: input['nomComplet'],
          rccm: input['rccm'],
          idNat: input['idNat'],
          addresse: input['addresse'],
          created: DateTime.parse(input['created']));
      try {
        await repos.banqueNames.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-banque/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = BanqueNameModel.fromJson(input);
      BanqueNameModel? data =
          await repos.banqueNames.getFromId(editH.id!); 

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
      repos.banqueNames.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-banque/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.banqueNames.deleteData(int.parse(id!));
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
