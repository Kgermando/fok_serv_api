import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/paiement_salaire_model.dart';
import '../../repository/repository.dart';

class PaiementSalaireHandlers {
  final Repository repos;

  PaiementSalaireHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PaiementSalaireModel> data = await repos.salaires.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-paiement', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PaiementSalaireModel data = PaiementSalaireModel(
          agent: input['agent'],
          observation: bool.hasEnvironment(input['observation']),
          modePaiement: input['modePaiement'],
          created: DateTime.parse(input['created']));
      try {
        await repos.salaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-paiement/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PaiementSalaireModel data = await repos.salaires.getFromId(int.parse(id!));

      // if (input['matricule'] != null) {
      //   salaireModel.matricule = input['matricule'];
      // }
      if (input['observation'] != null) {
        data.observation = bool.hasEnvironment(input['observation']);
      }
      if (input['modePaiement'] != null) {
        data.modePaiement = input['modePaiement'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.salaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-paiement/<id>', (Request request) async {
      var id = request.params['id'];
      repos.salaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page paiements salaire n\'est pas trouvé'),
    );
    return router;
  }
}
