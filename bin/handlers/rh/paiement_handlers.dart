import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/paiement_model.dart';
import '../../repository/repository.dart';

class PaiementHandlers {
  final Repository repos;

  PaiementHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PaiementModel> data = await repos.paiements.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-paiement', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PaiementModel data = PaiementModel(
          matricule: input['matricule'],
          observation: bool.hasEnvironment(input['observation']),
          modePaiement: input['modePaiement'],
          prime: input['prime'],
          created: DateTime.parse(input['created']));
      try {
        await repos.paiements.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-paiement/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PaiementModel data = await repos.paiements.getFromId(int.parse(id!));

      // if (input['matricule'] != null) {
      //   salaireModel.matricule = input['matricule'];
      // }
      if (input['observation'] != null) {
        data.observation = bool.hasEnvironment(input['observation']);
      }
      if (input['modePaiement'] != null) {
        data.modePaiement = input['modePaiement'];
      }
      if (input['prime'] != null) {
        data.prime = input['prime'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.paiements.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-paiement/<id>', (Request request) async {
      var id = request.params['id'];
      repos.paiements.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page paiement n\'est pas trouvé'),
    );
    return router;
  }
}
