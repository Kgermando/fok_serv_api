import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/suivi_controle/suivi_model.dart';
import '../../repository/repository.dart';
  

class SuiviHandlers {
  final Repository repos;

  SuiviHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<SuiviModel> data = await repos.suiviRepository.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late SuiviModel dataId;
      try {
        dataId = await repos.suiviRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataId.toJson()));
    });

    router.post('/insert-new-suivi', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      SuiviModel data = SuiviModel(
        reference: input['reference'],
        travailEffectue: input['travailEffectue'],
        accuseeReception: input['accuseeReception'],
        signature: input['signature'], 
        created: DateTime.parse(input['created']) 
      );
      try {
        await repos.suiviRepository.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-suivi/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = SuiviModel.fromJson(input);
      SuiviModel? data =
          await repos.suiviRepository.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['travailEffectue'] != null) {
        data.travailEffectue = input['travailEffectue'];
      }
      if (input['accuseeReception'] != null) {
        data.accuseeReception = input['accuseeReception'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      } 

      repos.suiviRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-suivi/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.suiviRepository.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page suivis n\'est pas trouvé'),
    );

    return router;
  }
}
