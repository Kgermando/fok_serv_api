import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/comptabilites/compte_bilan_ref_model.dart';
import '../../repository/repository.dart';

class CompteBilanRefHandlers {
  final Repository repos;

  CompteBilanRefHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CompteBilanRefModel> data = await repos.compteBilanRefRepository.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CompteBilanRefModel data;
      try {
        data = await repos.compteBilanRefRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });
 
    router.post('/insert-new-compte-bilan-ref', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CompteBilanRefModel data = CompteBilanRefModel(
        reference: input['reference'],
        comptes: input['comptes'],
        montant: input['montant'],
        type: input['type']
      );
      try {
        await repos.compteBilanRefRepository.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-compte-bilan-ref/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = CompteBilanRefModel.fromJson(input);
      CompteBilanRefModel? data =
          await repos.compteBilanRefRepository.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['type'] != null) {
        data.type = input['type'];
      }
      
      repos.compteBilanRefRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-compte-bilan-ref/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.compteBilanRefRepository.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page compte Bilan Ref n\'est pas trouvé'),
    );

    return router;
  }
}
