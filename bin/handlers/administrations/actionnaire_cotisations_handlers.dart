import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/administrations/actionnaire_cotisation_model.dart';
import '../../repository/repository.dart';


class ActionnaireCotisationHandlers {
  final Repository repos;

  ActionnaireCotisationHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ActionnaireCotisationModel> data = await repos.actionnaireCotisations.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ActionnaireCotisationModel data;
      try {
        data = await repos.actionnaireCotisations.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-actionnaire-cotisation', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ActionnaireCotisationModel data = ActionnaireCotisationModel(
          reference: input['reference'],
          nom: input['nom'],
          postNom: input['postNom'],
          prenom: input['prenom'],
          matricule: input['matricule'],
          montant: input['montant'],
          note: input['note'],
          moyenPayement: input['moyenPayement'],
          numeroTransaction: input['numeroTransaction'], 
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.actionnaireCotisations.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-actionnaire-cotisation/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = ActionnaireCotisationModel.fromJson(input);
      ActionnaireCotisationModel? data = await repos.actionnaireCotisations.getFromId(editH.id!);

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['postNom;'] != null) {
        data.postNom = input['postNom;'];
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
      if (input['note'] != null) {
        data.note = input['note'];
      }
      if (input['moyenPayement'] != null) {
        data.moyenPayement = input['moyenPayement'];
      }
      if (input['numeroTransaction'] != null) {
        data.numeroTransaction = input['numeroTransaction'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.actionnaireCotisations.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-actionnaire-cotisation/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.actionnaireCotisations.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page actionnaire-cotisation n\'est pas trouvé'),
    );

    return router;
  }
}
