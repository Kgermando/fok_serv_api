import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/update/update_model.dart';
import '../../repository/repository.dart';

class UpdateHandlers {
  final Repository repos;

  UpdateHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<UpdateModel> data = await repos.updateVersion.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late UpdateModel data;
      try {
        data = await repos.updateVersion.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-update-verion', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      UpdateModel data = UpdateModel(
        version: input['version'],
        urlUpdate: input['urlUpdate'], 
        created: DateTime.parse(input['created']),
        isActive: input['isActive'], 
        motif: input['motif']
      );
      try {
        await repos.updateVersion.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-update-verion/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = UpdateModel.fromJson(input);
      UpdateModel? data = await repos.updateVersion.getFromId(editH.id!);

      if (input['version'] != null) {
        data.version = input['version'];
      }
      if (input['urlUpdate'] != null) {
        data.urlUpdate = input['urlUpdate'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['isActive'] != null) {
        data.isActive = input['isActive'];
      } 
      if (input['motif'] != null) {
        data.motif = input['motif'];
      } 

      repos.updateVersion.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-update-verion/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.updateVersion.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Update version n\'est pas trouvé'),
    );

    return router;
  }
}
