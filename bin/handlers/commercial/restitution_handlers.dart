import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/commercial/restitution_model.dart';
import '../../repository/repository.dart';

class RestitutionHandlers {
  final Repository repos;

  RestitutionHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<RestitutionModel> data = await repos.restitutions.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late RestitutionModel data;
      try {
        data = await repos.restitutions.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-restitution', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      RestitutionModel data = RestitutionModel(
          idProduct: input['idProduct'],
          quantity: input['quantity'],
          unite: input['unite'],
          firstName: input['firstName'],
          lastName: input['lastName'],
          accuseReception: input['accuseReception'],
          accuseReceptionFirstName: input['accuseReceptionFirstName'],
          accuseReceptionLastName: input['accuseReceptionLastName'],
          role: input['role'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.restitutions.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-restitution/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = RestitutionModel.fromJson(input);
      RestitutionModel? data =
          await repos.restitutions.getFromId(editH.id!); 

      if (input['idProduct'] != null) {
        data.idProduct = input['idProduct'];
      }
      if (input['quantity'] != null) {
        data.quantity = input['quantity'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['firstName'] != null) {
        data.firstName = input['firstName'];
      }
      if (input['lastName'] != null) {
        data.lastName = input['lastName'];
      }
      if (input['accuseReception'] != null) {
        data.accuseReception = input['accuseReception'];
      }
      if (input['accuseReceptionFirstName'] != null) {
        data.accuseReceptionFirstName = input['accuseReceptionFirstName'];
      }
      if (input['accuseReceptionLastName'] != null) {
        data.accuseReceptionLastName = input['accuseReceptionLastName'];
      }
      if (input['role'] != null) {
        data.role = input['role'];
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
      repos.restitutions.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-restitution/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.restitutions.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page restitution n\'est pas trouvé'),
    );

    return router;
  }
}
