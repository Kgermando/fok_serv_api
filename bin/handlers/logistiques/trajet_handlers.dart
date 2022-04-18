import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/trajet_model.dart';
import '../../repository/repository.dart';

class TrajetHandlers {
  final Repository repos;

  TrajetHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<TrajetModel> data = await repos.trajets.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late TrajetModel trajetModel;
      try {
        trajetModel = await repos.trajets.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(trajetModel.toJson()));
    });

    router.post('/insert-new-trajet', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      TrajetModel trajetModel = TrajetModel(
          nomeroEntreprise: input['nomeroEntreprise'],
          nomUtilisateur: input['nomUtilisateur'],
          trajetDe: input['trajetDe'],
          trajetA: input['trajetA'],
          mission: input['mission'],
          kilometrageSorite: input['kilometrageSorite'],
          kilometrageRetour: input['kilometrageRetour'],
          created: DateTime.parse(input['created']),
          signature: input['signature']);

      try {
        await repos.trajets.insertData(trajetModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(trajetModel.toJson()));
    });

    router.put('/update-trajet/<id>', (Request request, String id) async {
      var id = request.params['id'];
      TrajetModel trajetModel = await repos.trajets.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nomeroEntreprise'] != null) {
        trajetModel.nomeroEntreprise = input['nomeroEntreprise'];
      }
      if (input['nomUtilisateur'] != null) {
        trajetModel.nomUtilisateur = input['nomUtilisateur'];
      }
      if (input['trajetDe'] != null) {
        trajetModel.trajetDe = input['trajetDe'];
      }
      if (input['trajetA'] != null) {
        trajetModel.trajetA = input['trajetA'];
      }
      if (input['mission'] != null) {
        trajetModel.mission = input['mission'];
      }
      if (input['kilometrageSorite'] != null) {
        trajetModel.kilometrageSorite = input['kilometrageSorite'];
      }
      if (input['kilometrageRetour'] != null) {
        trajetModel.kilometrageRetour = input['kilometrageRetour'];
      }
      if (input['created'] != null) {
        trajetModel.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        trajetModel.signature = input['signature'];
      }
      repos.trajets.update(trajetModel);
      return Response.ok(jsonEncode(trajetModel.toJson()));
    });

    router.delete('/delete-trajet/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.trajets.deleteData(int.parse(id!));
      return Response.ok('trajets supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page trajets n\'est pas trouvé'),
    );

    return router;
  }
}