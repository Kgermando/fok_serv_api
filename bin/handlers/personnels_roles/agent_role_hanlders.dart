import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/personnel_role/agent_role_model.dart';
import '../../repository/repository.dart';

class AgentRoleHandlers {
  final Repository repos;

  AgentRoleHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AgentRoleModel> data = await repos.agentsRoles.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AgentRoleModel dataId;
      try {
        dataId = await repos.agentsRoles.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataId.toJson()));
    });

    router.post('/insert-new-agent-role', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      AgentRoleModel data = AgentRoleModel(
          reference: input['reference'],
          departement: input['departement'],
          agent: input['agent'],
          role: input['role'],
          created: DateTime.parse(input['created'])
        );
      try {
        await repos.agentsRoles.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-agent-role/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = AgentRoleModel.fromJson(input);
      AgentRoleModel? data =
          await repos.agentsRoles.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['role'] != null) {
        data.role = input['role'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.agentsRoles.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-agent-role/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.agentsRoles.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Agent Role n\'est pas trouvé'),
    );
    return router;
  }
}
