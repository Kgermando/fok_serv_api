import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/actionnaire/actionnaire_transfert_model.dart';
import '../../repository/repository.dart';


class ActionnaireTransfertHandlers {
  final Repository repos;

  ActionnaireTransfertHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ActionnaireTransfertModel> data = await repos.actionnaireTransfertRepository.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ActionnaireTransfertModel data;
      try {
        data = await repos.actionnaireTransfertRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-actionnaire-tranfert', (Request request) async {
      var input = jsonDecode(await request.readAsString());
  
      ActionnaireTransfertModel data = ActionnaireTransfertModel(
          matriculeEnvoi: input['matriculeEnvoi'],
          matriculeRecu: input['matriculeRecu'], 
          montant: input['montant'], 
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.actionnaireTransfertRepository.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-actionnaire-tranfert/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = ActionnaireTransfertModel.fromJson(input);
      ActionnaireTransfertModel? data = await repos.actionnaireTransfertRepository.getFromId(editH.id!);

      if (input['matriculeEnvoi'] != null) {
        data.matriculeEnvoi = input['matriculeEnvoi'];
      }
      if (input['matriculeRecu'] != null) {
        data.matriculeRecu = input['matriculeRecu'];
      } 
      if (input['montant'] != null) {
        data.montant = input['montant'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.actionnaireTransfertRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-actionnaire-tranfert/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.actionnaireTransfertRepository.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page actionnaire-tranfert n\'est pas trouvé'),
    );

    return router;
  }
}
