import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/immobilier_model.dart';
import '../../repository/repository.dart';

class ImmobilierHandlers {
  final Repository repos;

  ImmobilierHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ImmobilierModel> data = await repos.immobiliers.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ImmobilierModel immobilierModel;
      try {
        immobilierModel = await repos.immobiliers.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(immobilierModel.toJson()));
    });

    router.post('/insert-new-immobilier', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      ImmobilierModel immobilierModel = ImmobilierModel(
          typeAllocation: input['typeAllocation'],
          adresse: input['adresse'],
          numeroCertificat: input['numeroCertificat'],
          superficie: input['superficie'],
          dateAcquisition: DateTime.parse(input['dateAcquisition']),
          created: DateTime.parse(input['created']),
          signature: input['signature']);

      try {
        await repos.immobiliers.insertData(immobilierModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(immobilierModel.toJson()));
    });

    router.put('/update-immobilier/<id>', (Request request, String id) async {
      var id = request.params['id'];
      ImmobilierModel immobilierModel = await repos.immobiliers.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['typeAllocation'] != null) {
        immobilierModel.typeAllocation = input['typeAllocation'];
      }
      if (input['adresse'] != null) {
        immobilierModel.adresse = input['adresse'];
      }
      if (input['numeroCertificat'] != null) {
        immobilierModel.numeroCertificat = input['numeroCertificat'];
      }
      if (input['superficie'] != null) {
        immobilierModel.superficie = input['superficie'];
      }
      if (input['dateAcquisition'] != null) {
        immobilierModel.dateAcquisition = DateTime.parse(input['dateAcquisition']);
      }
      if (input['created'] != null) {
        immobilierModel.created = DateTime.parse(input['created']);
      }
      if (input['signature'] != null) {
        immobilierModel.signature = input['signature'];
      }
      repos.immobiliers.update(immobilierModel);
      return Response.ok(jsonEncode(immobilierModel.toJson()));
    });

    router.delete('/delete-immobilier/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.immobiliers.deleteData(int.parse(id!));
      return Response.ok('immobiliers supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page immobiliers n\'est pas trouvé'),
    );

    return router;
  }
}