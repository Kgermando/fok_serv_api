import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/paiement_divers_model.dart';
import '../../repository/repository.dart';

class PaiementDiversHandlers {
  final Repository repos;

  PaiementDiversHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PaiementDiversModel> data = await repos.paiementDivers.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-paiement', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PaiementDiversModel data = PaiementDiversModel(
          agent: input['agent'],
          observation: bool.hasEnvironment(input['observation']),
          modePaiement: input['modePaiement'],
          divers: input['divers'],
          created: DateTime.parse(input['created']));
      try {
        await repos.paiementDivers.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-paiement/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PaiementDiversModel data = await repos.paiementDivers.getFromId(int.parse(id!));

      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['observation'] != null) {
        data.observation = bool.hasEnvironment(input['observation']);
      }
      if (input['modePaiement'] != null) {
        data.modePaiement = input['modePaiement'];
      }
      if (input['divers'] != null) {
        data.divers = input['divers'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.paiementDivers.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-paiement/<id>', (Request request) async {
      var id = request.params['id'];
      repos.paiementDivers.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page paiements divers n\'est pas trouvé'),
    );
    return router;
  }
}
