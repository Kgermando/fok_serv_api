import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/devis/devis_models.dart';
import '../../repository/repository.dart';

class DevisHandlers {
  final Repository repos;

  DevisHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<DevisModel> data = await repos.devis.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late DevisModel data;
      try {
        data = await repos.devis.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-devis', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      DevisModel data = DevisModel(
          title: input['title'],
          priority: input['priority'],
          departement: input['departement'],
          observation: input['observation'],
          signature: input['signature'],
          createdRef: DateTime.parse(input['createdRef']),
          created: DateTime.parse(input['created']),
        isSubmit: input['isSubmit'],
        approbationDG: input['approbationDG'],
          motifDG: input['motifDG'],
          signatureDG: input['signatureDG'],
          approbationBudget: input['approbationBudget'],
          motifBudget: input['motifBudget'],
          signatureBudget: input['signatureBudget'],
          approbationFin: input['approbationFin'],
          motifFin: input['motifFin'],
          signatureFin: input['signatureFin'],
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD'],
          ligneBudgetaire: input['ligneBudgetaire'],
          ressource: input['ressource']
      );
      try {
        await repos.devis.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-devis/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = DevisModel.fromJson(input);
      DevisModel? data =
          await repos.devis.getFromId(editH.id!); 

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['priority'] != null) {
        data.priority = input['priority'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['observation'] != null) {
        data.observation = input['observation'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      // if (input['createdRef'] != null) {
      //   data.createdRef = DateTime.parse(input['createdRef']); Ne pas modifier ficher refence
      // }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['isSubmit'] != null) {
        data.isSubmit = input['isSubmit'];
      }

      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['motifDG'] != null) {
        data.motifDG = input['motifDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['motifBudget'] != null) {
        data.motifBudget = input['motifBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['motifFin'] != null) {
        data.motifFin = input['motifFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['ligneBudgetaire'] != null) {
        data.ligneBudgetaire = input['ligneBudgetaire'];
      }
      if (input['ressource'] != null) {
        data.ressource = input['ressource'];
      }


      repos.devis.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-devis/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.devis.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page devis n\'est pas trouvé'),
    );

    return router;
  }
}
