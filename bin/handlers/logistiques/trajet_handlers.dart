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
          signature: input['signature'],
          createdRef: DateTime.parse(input['createdRef']),
          created: DateTime.parse(input['created']),
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD']
        );

      try {
        await repos.trajets.insertData(trajetModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(trajetModel.toJson()));
    });

    router.put('/update-trajet/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = TrajetModel.fromJson(input);
      TrajetModel? data =
          await repos.trajets.getFromId(editH.id!); 
          
      if (input['nomeroEntreprise'] != null) {
        data.nomeroEntreprise = input['nomeroEntreprise'];
      }
      if (input['nomUtilisateur'] != null) {
        data.nomUtilisateur = input['nomUtilisateur'];
      }
      if (input['trajetDe'] != null) {
        data.trajetDe = input['trajetDe'];
      }
      if (input['trajetA'] != null) {
        data.trajetA = input['trajetA'];
      }
      if (input['mission'] != null) {
        data.mission = input['mission'];
      }
      if (input['kilometrageSorite'] != null) {
        data.kilometrageSorite = input['kilometrageSorite'];
      }
      if (input['kilometrageRetour'] != null) {
        data.kilometrageRetour = input['kilometrageRetour'];
      } 

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      repos.trajets.update(data);
      return Response.ok(jsonEncode(data.toJson()));
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