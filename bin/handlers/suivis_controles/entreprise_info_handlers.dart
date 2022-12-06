import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/suivi_controle/entreprise_info_model.dart'; 
import '../../repository/repository.dart';

class EntrepriseInfoHandlers {
  final Repository repos;

  EntrepriseInfoHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<EntrepriseInfoModel> data = await repos.entrepriseRepository.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late EntrepriseInfoModel dataId;
      try {
        dataId = await repos.entrepriseRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataId.toJson()));
    });

    router.post('/insert-new-entreprise-info', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      EntrepriseInfoModel data = EntrepriseInfoModel(
        nomSocial: input['nomSocial'],
        nomGerant: input['nomGerant'],
        emailEntreprise: input['emailEntreprise'],
        emailGerant: input['emailGerant'],
        telephone1: input['telephone1'],
        telephone2: input['telephone2'],
        rccm: input['rccm'],
        identificationNationale: input['identificationNationale'],
        numerosImpot: input['numerosImpot'],
        secteurActivite: input['secteurActivite'],
        adressePhysiqueEntreprise: input['adressePhysiqueEntreprise'],
        signature: input['signature'],
        created: DateTime.parse(input['created']) 
      );
      try {
        await repos.entrepriseRepository.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-entreprise-info/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = EntrepriseInfoModel.fromJson(input);
      EntrepriseInfoModel? data =
          await repos.entrepriseRepository.getFromId(editH.id!); 

      if (input['nomSocial'] != null) {
        data.nomSocial = input['nomSocial'];
      }
      if (input['nomGerant'] != null) {
        data.nomGerant = input['nomGerant'];
      }
      if (input['emailEntreprise'] != null) {
        data.emailEntreprise = input['emailEntreprise'];
      }
      if (input['emailGerant'] != null) {
        data.emailGerant = input['emailGerant'];
      }
      if (input['telephone1'] != null) {
        data.telephone1 = input['telephone1'];
      }
      if (input['telephone2'] != null) {
        data.telephone2 = input['telephone2'];
      }
      if (input['rccm'] != null) {
        data.rccm = input['rccm'];
      }
      if (input['identificationNationale'] != null) {
        data.identificationNationale = input['identificationNationale'];
      }
      if (input['numerosImpot'] != null) {
        data.numerosImpot = input['numerosImpot'];
      }
      if (input['secteurActivite'] != null) {
        data.secteurActivite = input['secteurActivite'];
      }
      if (input['adressePhysiqueEntreprise'] != null) {
        data.adressePhysiqueEntreprise = input['adressePhysiqueEntreprise'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.entrepriseRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-entreprise-info/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.entrepriseRepository.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page Entreprise Info n\'est pas trouvé'),
    );

    return router;
  }
}
