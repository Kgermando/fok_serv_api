import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/number_facture.dart';
import '../../repository/repository.dart';

class NumberFactHandlers {
  final Repository repos;

  NumberFactHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<NumberFactureModel> data = await repos.numberFacture.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late NumberFactureModel data;
      try {
        data = await repos.numberFacture.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-number-fact', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      NumberFactureModel data = NumberFactureModel(
          number: input['number'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.numberFacture.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-number-fact/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = NumberFactureModel.fromJson(input);
      NumberFactureModel? data =
          await repos.numberFacture.getFromId(editH.id!); 

      if (input['number'] != null) {
        data.number = input['number'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
      }
      repos.numberFacture.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-number-fact/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.numberFacture.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page numberFacture n\'est pas trouvé'),
    );

    return router;
  }
}
