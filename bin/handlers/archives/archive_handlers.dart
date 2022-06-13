import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/archive/archive_model.dart';
import '../../repository/repository.dart';

class ArchiveHandlers {
  final Repository repos;

  ArchiveHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ArchiveModel> data = await repos.archives.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ArchiveModel data;
      try {
        data = await repos.archives.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-archive', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ArchiveModel data = ArchiveModel(
        departement: input['departement'],
        folderName: input['folderName'],
        nomDocument: input['nomDocument'],
        description: input['description'],
        fichier: input['fichier'],
        signature: input['signature'],
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.archives.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-archive/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ArchiveModel.fromJson(input);
      ArchiveModel? data =
          await repos.archives.getFromId(editH.id!); 

      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['folderName'] != null) {
        data.folderName = input['folderName'];
      }
      if (input['nomDocument'] != null) {
        data.nomDocument = input['nomDocument'];
      }
      if (input['description'] != null) {
        data.description = input['description'];
      }
      if (input['fichier'] != null) {
        data.fichier = input['fichier'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.archives.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-archive/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.archives.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page archive n\'est pas trouvé'),
    );

    return router;
  }
}
