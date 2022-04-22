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
          approbationDG: input['approbationDG'],
          signatureDG: input['signatureDG'],
          signatureJustificationDG: input['signatureJustificationDG'],
          approbationFin: input['approbationFin'],
          signatureFin: input['signatureFin'],
          signatureJustificationFin: input['signatureJustificationFin'],
          approbationBudget: input['approbationBudget'],
          signatureBudget: input['signatureBudget'],
          signatureJustificationBudget: input['signatureJustificationBudget'],
          approbationDD: input['approbationDD'],
          signatureDD: input['signatureDD'],
          signatureJustificationDD: input['signatureJustificationDD'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));

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
      TrajetModel data = await repos.trajets.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

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
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }

      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
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