import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/actionnaire/actionnaire_model.dart';
import '../../repository/repository.dart';

class ActionnaireHandlers {
  final Repository repos;

  ActionnaireHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ActionnaireModel> data = await repos.actionnaires.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/get-data-limit/', (Request request) async {
      List<ActionnaireModel> data = await repos.actionnaires.getAllDataLimit();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ActionnaireModel data;
      try {
        data = await repos.actionnaires.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-actionnaire', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ActionnaireModel data = ActionnaireModel(
        nom: input['nom'],
        postNom: input['postNom'],
        prenom: input['prenom'],
        email: input['email'],
        telephone: input['telephone'],
        adresse: input['adresse'],
        sexe: input['sexe'],
        matricule: input['matricule'],
        signature: input['signature'], 
        created: DateTime.parse(input['created']),
        cotisations: input['cotisations']
      );
      try {
        await repos.actionnaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-actionnaire/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = ActionnaireModel.fromJson(input);
      ActionnaireModel? data = await repos.actionnaires.getFromId(editH.id!);

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['postNom'] != null) {
        data.postNom = input['postNom'];
      }
      if (input['prenom'] != null) {
        data.prenom = input['prenom'];
      }
      if (input['email'] != null) {
        data.email = input['email'];
      }
      if (input['telephone'] != null) {
        data.telephone = input['telephone'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['sexe'] != null) {
        data.sexe = input['sexe'];
      }
      if (input['matricule'] != null) {
        data.matricule = input['matricule'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['cotisations'] != null) {
        data.cotisations = input['cotisations'];
      }

      repos.actionnaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-actionnaire/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.actionnaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page actionnaire n\'est pas trouvé'),
    );

    return router;
  }
}
