import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/transport_restauration_model.dart';
import '../../repository/repository.dart';

class TransRestAgentsHandlers {
  final Repository repos;

  TransRestAgentsHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<TransRestAgentsModel> data = await repos.transRestAgents.getAllData();
      return Response.ok(jsonEncode(data));
    });
 
    router.get('/<id>', (Request request, String id) async {
      late TransRestAgentsModel data;
      try {
        data = await repos.transRestAgents.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });


    router.post('/insert-new-trans-rest-agent', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      TransRestAgentsModel data = TransRestAgentsModel(
        reference: input['reference'],
        nom: input['nom'],
        prenom: input['prenom'],
        matricule: input['matricule'],
        montant: input['montant'],
        observation: input['observation'],
      );

      try {
        await repos.transRestAgents.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-trans-rest-agent/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = TransRestAgentsModel.fromJson(input);
      TransRestAgentsModel? data =
          await repos.transRestAgents.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['prenom'] != null) {
        data.prenom = input['prenom'];
      }
      if (input['matricule'] != null) {
        data.matricule = input['matricule'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['observation'] != null) {
        data.observation = input['observation'];
      }
      repos.transRestAgents.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-trans-rest-agent/<id>', (Request request) async {
      var id = request.params['id'];
      repos.transRestAgents.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Trans et Rest agents n\'est pas trouvé'),
    );
    return router;
  }
}