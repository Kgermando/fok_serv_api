import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/archive/archive_model.dart';
import '../../repository/repository.dart';

class ArchiveFolderHandlers {
  final Repository repos;

  ArchiveFolderHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ArchiveFolderModel> data = await repos.archivesFolders.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ArchiveFolderModel data;
      try {
        data = await repos.archivesFolders.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-archive-folder', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      ArchiveFolderModel data = ArchiveFolderModel(
        departement: input['departement'],
        folderName: input['folderName'],
        signature: input['signature'],
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.archivesFolders.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-archive-folder/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ArchiveFolderModel.fromJson(input);
      ArchiveFolderModel? data =
          await repos.archivesFolders.getFromId(editH.id!); 

      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['folderName'] != null) {
        data.folderName = input['folderName'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.archivesFolders.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-archive-folder/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.archivesFolders.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page archive folder n\'est pas trouvé'),
    );

    return router;
  }
}
