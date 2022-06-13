import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/finances/coupure_billet_model.dart';
import '../../repository/repository.dart';

class CoupureBilletHandlers {
  final Repository repos;

  CoupureBilletHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CoupureBilletModel> data = await repos.coupureBillets.getAllData();
      return Response.ok(jsonEncode(data));
    }); 


    router.get('/<id>', (Request request, String id) async {
      late CoupureBilletModel data;
      try {
        data = await repos.coupureBillets.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-coupure-billet', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CoupureBilletModel data = CoupureBilletModel(
        reference: input['reference'],
        nombreBillet: input['nombreBillet'],
        coupureBillet: input['coupureBillet']
      );
      try {
        await repos.coupureBillets.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-coupure-billet/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = CoupureBilletModel.fromJson(input);
      CoupureBilletModel? data =
          await repos.coupureBillets.getFromId(editH.id!); 

      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['nombreBillet'] != null) {
        data.nombreBillet = input['nombreBillet'];
      }
      if (input['coupureBillet'] != null) {
        data.coupureBillet = input['coupureBillet'];
      } 
      repos.coupureBillets.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-coupure-billet/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.coupureBillets.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page coupure-billet n\'est pas trouvé'),
    );

    return router;
  }
}
